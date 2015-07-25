class UsersController < ApplicationController

  def index
  end

  def show
    @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render file: 'public/404.html', status: :not_found
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
