class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
    # {"controller"=>"tasks", "action"=>"show", "id"=>":id"} permitted: false>
  end

  def new
    @new_task = Task.new
  end

  def create
    @task = Task.new(strong_params)
    @task.save
    redirect_to tasks_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(strong_params)
    redirect_to tasks_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end

  private

  def strong_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
