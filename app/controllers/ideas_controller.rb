class IdeasController < ApplicationController
  before_action :set_project
  before_action :set_idea, only: [:show, :edit, :update]

  def new
    @idea = @project.ideas.build
  end

  def create
    @idea = @project.ideas.build(idea_params)
    if @idea.save
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
  end

  def update
    if @idea.update(idea_params)
      flash[:success] = "Idea edited successfully"
      redirect_to [@project, @idea]
    else
      flash.now[:alert] = "Idea not saved"
      render "edit"
    end
  end

  private

    def idea_params
      params.require(:idea).permit(:title, :description)
    end

    def set_project
      @project = Project.find(params[:project_id])
    end

    def set_idea
      @idea = @project.ideas.find(params[:id])
    end
end
