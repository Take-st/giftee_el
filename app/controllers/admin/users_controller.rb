class Admin::UsersController < ApplicationController
  before_action :require_admin
  skip_before_action :login_required, only: [:index]

  def index
    @users = User.all
  end


  def show 
    @user = User.find(params[:id])
  end


  def new
    @user =User.new
  end


  def edit
    @user = User.find(params[:id])
  end


  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "ユーザー「#{@user.name}」を登録しました。"
      redirect_to admin_users_path
    else
      render :new
    end
  end


  def update
    @user = User.find(params[:id])
    
    if @user.update(user_params)
      flash[:success] = "ユーザー「#{@user.name}」を更新しました。"
      redirect_to admin_user_path(@user)
    else
      render :new
    end
  end


  def destroy
    @user = User.find(params[:id])
    if current_user != @user
      @user.destroy
      flash[:success] = "ユーザー「#{@user.name}」を削除しました。"
    else
      flash[:danger] = "管理ユーザーは自分を削除できません。"
      redirect_to admin_users_url
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :admin, :password, :password_confirmation)
  end

  def require_admin
    unless current_user
      flash[:danger] = "管理者権限がありません。ログインしてください。"
      redirect_to login_path
      return
    else
      unless current_user.admin?
        flash[:danger] = "管理者権限がありません。"
        redirect_to root_path
      end
    end
  end

end




