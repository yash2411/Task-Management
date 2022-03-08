class ProjectsController < ApplicationController
  before_action :check_user, only: [:create, :new, :index, :destroy, :edit, :update]

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
      redirect_to projects_path
    else
      flash[:danger] = "Title is invalid"
      redirect_to new_project_path
    end
  end

  def edit
    @project = current_user.projects.find(params[:id])
  end

  def update
    @project = current_user.projects.find(params[:id])
    if @project.update(project_params)
      flash[:success] = "Your Project is updated"
      redirect_to projects_path
    else

      flash[:success] = "Project is not updated"
      render 'edit'
    end
  end


  def destroy
    project = current_user.projects.find(params[:id])
    project.destroy
    flash[:success] = "Project deleted successfully"
    redirect_to projects_path
  end

  private
  def project_params
    params.require(:project).permit(:pname)
  end

  def check_user
    redirect_to root_path unless current_user
  end
end
