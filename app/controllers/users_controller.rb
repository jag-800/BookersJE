class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :show, :index]
  before_action :is_matching_login_user, only: [:edit, :update]
  
  def ransack
    @q = User.ransack(params[:q])
    @results = @q.result
    @book = Book.new
  end
  
  def index
    @q = User.ransack(params[:q])
    @users = User.all
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "you have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to current_user
    end
  end
end
