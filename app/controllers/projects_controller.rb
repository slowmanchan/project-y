class ProjectsController < ApplicationController
  before_action :set_user, only: [:new, :create, :show]
  before_action :setup_project, only: [:show, :destroy, :edit, :update]
  
  def index
    @projects = Project.all
  end

  def new
    @project = @user.projects.new
  end

  def create
    @project = @user.projects.build(project_params)
    if @project.save
      flash[:success] = "Your project is alive!"
      redirect_to @project
    else
      flash.now[:alert] = "Project has not been created."
      render 'new'
    end
  end

  def edit
  end

  def show

  end

  def update
    if @project.update(project_params)
      flash[:success] = "Project saved!"
      redirect_to @project
    else
      flash.now[:alert] = "Project not saved"
      render "edit"
    end
  end

  def destroy

    @project.destroy

    flash[:success] = "Project deleted"
    redirect_to projects_path
  end

  private

    def project_params
      params.require(:project).permit(:title, :description, :level)
    end

    def setup_project
      @project = Project.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The project does not exist"
      redirect_to projects_path
    end

    def sanitize_params
      @project = @user.projects.new(project_params)
    end

    def set_user
      @user = current_user
    end

end
