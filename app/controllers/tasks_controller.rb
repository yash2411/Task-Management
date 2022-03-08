class TasksController < ApplicationController
  before_action :check_user, only: [:create, :new, :index, :destroy, :edit, :update]

  def current_project
    @project = current_user.projects.find((params[:pid]))
    
  end

  def index
    @project = current_project
    @tasks = @project.tasks
  end

  def new
    @pid = params[:pid]
    @task = Task.new
  end

  def edit
    @project = current_project
    @task = @project.tasks.find(params[:id])
  end

  def update
    @project = current_project
    @task = @project.tasks.find(params[:id])
    @task.update(task_params)
    flash[:success] = "Task Updated"
    redirect_to tasks_path(pid: @project.id)
  end

  def create
    @project = current_project
    @task = @project.tasks.new(task_params)
    if @task.save
      flash[:success] = "task created successfully"
      redirect_to tasks_path(pid: @project.id)
    else
      flash[:danger] = "Title is invalid"
      redirect_to new_task_path
    end
  end

  def destroy
    @project = current_project
    @task = @project.tasks.find(params[:id])
    @task.destroy
    redirect_to tasks_path(pid: @project.id)
  end

 

  private
  def task_params
    params.require(:task).permit(:tname)
  end

  def check_user
    redirect_to root_path unless current_user
  end
end
