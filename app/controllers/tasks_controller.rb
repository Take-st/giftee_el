class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  #application_helperでも使えるようにする。application_helperはviewから呼び出せる。
  helper_method :sort_column, :sort_direction
  
  def index
    @tasks = current_user.tasks.search(params[:search]).order(sort_column + ' ' + sort_direction).page(params[:page])
    set_task_count
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      redirect_to tasks_url, notice: "タスク「#{@task.name}」を登録しました。"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to task_url, notice: "タスク「#{@task.name}」を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_url, notice: "タスク「#{@task.name}」を削除しました。"
  end

  private

    def task_params
      params.require(:task).permit(:name, :status, :priority, :description, :deadline_at)
    end

    def sort_column
      Task.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end

    def set_task
      @task = current_user.tasks.find(params[:id])
    end

end
