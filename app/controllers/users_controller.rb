class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update]

  def show
    @projects = Project.where(user_id: current_user.id).order('created_at Desc')
  end

  def edit
  end

  def update

    if params[:user][:password].blank?
      params[:user].delete(:password)
    end

    if @user.update(user_params)
      sign_in @user, bypass: true
      flash[:success] = "Updated successfully"
      redirect_to @user
    else
      flash.now[:alert] = "Update unsuccessful"
      render "edit"
    end
  end

  private

    def user_params
      params.require(:user).permit(:email, :password,  :bio, :location)
    end

    def set_user
      @user = User.find(params[:id])
    end

end
