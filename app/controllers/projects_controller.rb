class ProjectsController < ApplicationController
  before_action :setup_project, only: [:edit, :show, :update]
  before_action :sanitize_params, only: [:create]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
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

  private

    def project_params
      params.require(:project).permit(:title, :description)
    end

    def setup_project
      @project = Project.find(params[:id])
    end

    def sanitize_params
      @project = Project.new(project_params)
    end
end
