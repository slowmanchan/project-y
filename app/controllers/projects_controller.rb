class ProjectsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_user, only: [:new, :create, :show]
  before_action :setup_project, only: [:show, :destroy, :edit, :update]

  def index
    @tags = Project.tag_counts_on(:tags)
    @users = User.order("ideas_count desc")

    if user_signed_in?
      @meetings = Meeting.where(user_id: current_user.id)
    end

    if params[:tag]
      @projects = Project.tagged_with(params[:tag])
    else
      @projects = Project.order('created_at DESC')
    end
  end

  def new
    @project = @user.projects.new
  end

  def create
    @project = @user.projects.build(project_params)

    if @project.save
      set_role

      flash[:success] = "Your project is alive!"
      redirect_to @project
    else
      flash.now[:alert] = "Project has not been created."
      render 'new'
    end
  end

  def edit
    authorize @project, :update?
  end

  def show
  end

  def update
    authorize @project, :update?
    if @project.update(project_params)
      flash[:success] = "Project saved!"
      redirect_to @project
    else
      flash.now[:alert] = "Project not saved"
      render "edit"
    end
  end

  def destroy
    authorize @project, :destroy?

    @project.destroy

    flash[:success] = "Project deleted"
    redirect_to projects_path
  end

  def tag_cloud
    @tags = Project.tag_counts_on(:tags)
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :level, :help, :tag_list)
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

  def set_role
    @role = @project.roles.new
    @role.role = "manager"
    @role.user_id = current_user.id
    @role.save
  end

end
