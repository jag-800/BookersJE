class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :show, :index]
  before_action :is_matching_login_user, only: [:edit, :update]

  def index
    @books = Book.all
    @book = Book.new
    if params[:tag_name]
      @books = Book.tagged_with("#{params[:tag_name]}").page(params[:page]).per(5)
    end
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have creaed book successfully."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
    @books = Book.all
    @book_new = Book.new
    @user = @book.user
    @book_comment = BookComment.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :tag_list)
  end

  def is_matching_login_user
    post = Book.find(params[:id])
    unless post.user_id == current_user.id
      redirect_to books_path
    end
  end

end
