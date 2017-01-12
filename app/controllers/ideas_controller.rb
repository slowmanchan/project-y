class IdeasController < ApplicationController
  before_action :set_project
  before_action :set_idea, only: [:show, :edit, :update, :destroy]

  def new
    @idea = @project.ideas.build
  end

  def create

    @idea = @project.ideas.build(idea_params)
    @idea.user = current_user

    if @idea.save
      set_role

      (@project.users.uniq - [current_user]).each do |user|
        Notification.create(recipient: user, actor: current_user, action: "posted", notifiable: @idea)
      end

      flash[:success] = "Idea added successfully"
      redirect_to [@project, @idea]
    else
      flash.now[:alert] = "Idea not added"
      render "new"
    end
  end

  def show
  end

  def edit
    authorize @idea, :update?
  end

  def update

    authorize @idea, :update?

    if @idea.update(idea_params)
      flash[:success] = "Idea edited successfully"
      redirect_to [@project, @idea]
    else
      flash.now[:alert] = "Idea not saved"
      render "edit"
    end
  end

  def destroy
    authorize @idea, :destroy?

    @idea.destroy
    flash[:success] = "Deleted!"
    redirect_to @project
  end

  private

    def idea_params
      params.require(:idea).permit(:title, :description, :ideas_count)
    end

    def set_project
      @project = Project.find(params[:project_id])
    end

    def set_idea
      @idea = @project.ideas.find(params[:id])
    end

    def set_role
      @role = @idea.roles.new
      @role.user_id = current_user.id
      @role.role = 'manager'
      @role.save
    end

end
