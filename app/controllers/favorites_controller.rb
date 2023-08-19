class FavoritesController < ApplicationController
  
  def create
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.new(book_id: book.id)
    favorite.save
    if request.referer&.ends_with?(book_path(book))
      redirect_to book_path(book)
    else
      redirect_to books_path
    end
  end

  def destroy
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: book.id)
    favorite.destroy
    if request.referer&.ends_with?(book_path(book))
      redirect_to book_path(book)
    else
      redirect_to books_path
    end
  end
end
