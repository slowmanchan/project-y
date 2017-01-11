class Projects::GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :setup_project

  def create
    @project.groups.where(user_id: current_user.id).first_or_create

    respond_to do |format|
      format.html {redirect_to @project}
      format.js
    end
  end

  def destroy
    @project.groups.where(user_id: current_user.id).destroy_all

    respond_to do |format|
      format.html {redirect_to @project}
      format.js
    end
  end

  def setup_project
    @project = Project.find(params[:project_id])
  end
end
