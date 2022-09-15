class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task
  before_action :set_category, only: [:show, :edit, :update, :destroy, :sort]
  
  def new
    @category = @task.categories.new
  end
  
  def edit
  end
  
  def sort
  end
  
  def create
    @category = @task.categories.new(category_params)
    
    if @category.save
      redirect_to @category, notice: 'Category was successfully created.'
    else
      render :new
    end
  end
  
  def update
    if @category.update(category_params)
      redirect_to @category, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end
  
  def destroy
    @category.destroy
  end
  
  private
  
  def set_task
    @task = current_user.tasks.find_by(id: params[:task_id])
    redirect_to(tasks_url, alert: "ERROR!!") if @task.blank?
  end
  
  def set_category
    @category = @task.categories.find_by(id: params[:id])
  end
  
  def category_params
    params.require(:category).permit(:name, :position)
  end
  
end
