class Admin::UsersController < Admin::ApplicationController
  before_action :set_user, only: [:edit, :show, :update, :archive]

  def index
    @users = User.excluding_archived.order(:email)
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "User has been created."
      redirect_to admin_users_path
    else
      flash.now[:alert] = "User not created"
      render "new"
    end
  end

  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
    end

    if @user.update(user_params)
      flash[:success] = "User successfully updated"
      redirect_to [:admin, @user]
    else
      flash.now[:alert] = "User has not been updated"
      render "edit"
    end
  end

  def archive
    if @user == current_user
      flash[:alert] = "you cannot archive yourself"
    else
      @user.archive
      flash[:notice] = "User archived"
    end
    redirect_to admin_users_path

  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :admin)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
