class TasksController < BaseController
  before_action :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  def index
    @tasks = current_user.tasks.all
  end
  
  def new
    @task = current_user.tasks.new
  end
  
  def edit
  end
  
  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      redirect_to tasks_path, notice:"タスク登録が出来ました！！"
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: "タスクが更新できました！！"
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @task.destroy
    redirect_to task_url, notice: "タスクが削除できました！！"
  end
  
  private
  
  def set_task
    @task = current_user.tasks.find(params[:id])
  end
  
  def task_params
    params.require(:task).permit(:title, :start_at, :end_at, :repeat, :place, :content, :category_id)
  end
  
end
