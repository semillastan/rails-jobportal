class UsersController < ApplicationController

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
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
  end

  def destroy
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

end
