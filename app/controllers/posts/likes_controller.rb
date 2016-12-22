class Projects::LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project

  def create
    @project.likes.where(user_id: current_user.id).first_or_create

    respond_to do |format|
      format.html { redirect_to @project }
      format.js
    end
  end

  def destroy
    @project.likes.where(user_id: current_user.id).destroy_all

    respond_to do |format|
      format.html { redirect_to @project }
      format.js
    end
  end

  private

    def set_project
      @project = Project.find(params[:project_id])
    end

end
