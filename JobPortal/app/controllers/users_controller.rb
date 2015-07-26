class UsersController < ApplicationController

  before_action :logged_in_user, only: [:edit, :update, :show]
  before_action :correct_user, only: [:edit, :update, :show]

  def index
  end

  def show
    @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render file: 'public/404.html', status: :not_found
  end

  def new
    @user = User.new    
  end

  def create
    @user = User.create(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to Rails Job Portal"
      redirect_to(root_url)
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
  end

  def change_password
    @user = current_user
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url 
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

end
