class ProjectsController < ApplicationController
  before_action :check_user, only: [:create, :new, :index, :destroy]

  def index
    @projects = current_user.projects.all
    render 'index'
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      flash[:success] = "Project created successfully"
      redirect_to root_path
    else
      flash[:danger] = "Title is invalid"
      redirect_to root_path
    end
  end

  def destroy
    project = current_user.projects.find(params[:id])
    project.destroy
    redirect_to new_project_path
  end

  private
  def project_params
    params.require(:project).permit(:pname)
  end

  def check_user
    redirect_to root_path unless current_user
  end
end
