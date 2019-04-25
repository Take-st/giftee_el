class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  #application_helperでも使えるようにする。application_helperはviewから呼び出せる。
  #ヘルパーメソッドはほぼすべて甘え。MVCの責務範囲がぶれる。
  helper_method :sort_column, :sort_direction
  
  def index
    if params[:category_id]
      @tasks = current_user.tasks.from_category(params[:category_id]).page(params[:page])
    else
      # だめ
      @tasks = current_user.tasks.search(params[:search]).order(sort_column + ' ' + sort_direction).page(params[:page])
      set_task_count
    end
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.new(task_params)
    # puts params[:task][:category].split(",")
    # タスクだけ作って、あとからカテゴリ追加がいい
    category_list = params[:task][:category].split(",")
    # puts category_list
    if @task.save
      @task.save_categories(category_list)
      flash[:success] = "タスク「#{@task.name}」を登録しました。"
      redirect_to tasks_url
    else
      render :new
    end
  end

  def edit
    @category_list = @task.categories.pluck(:name).join(",")
  end

  def update
    category_list = params[:task][:category].split(",")
    if @task.update(task_params)
      @task.save_categories(category_list)
      flash[:success] = "タスク「#{@task.name}」を更新しました。"
      redirect_to tasks_url
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    flash[:success] = "タスク「#{@task.name}」を削除しました。"
    redirect_to tasks_url
  end

  private

    def task_params
      params.require(:task).permit(:name, :status, :priority, :description, :deadline_at, :tag_list)
    end

    def sort_column
      # スコープでやれ
      Task.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
    end
    
    def sort_direction
      # スコープでやれ
      #  てか上とセットで一個でやれ
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end

    def set_task
      @task = current_user.tasks.find(params[:id])
    end

end
