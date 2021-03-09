class FavoritesController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    # @favorite = Favorite.find(params[:id])
    # Favorite.create(user_id: current_user.id, book_id: book.id)
    favorite = Favorite.new
    # favorite = current_user.favorites.new(book_id: book.id)
    # 上記と同じ意味
    favorite.book_id = book.id
    favorite.user_id = current_user.id
    favorite.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    book = Book.find(params[:book_id])
    # @favorite = Favorite.find(params[:id])
    favorite = current_user.favorites.find_by(book_id: book.id)
    favorite.destroy!
    redirect_back(fallback_location: root_path)
  end
  
end
