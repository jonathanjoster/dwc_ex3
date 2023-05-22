class FavoritesController < ApplicationController
  # before_action :is_matching_login_user
  def create
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.new(book_id: book.id)
    favorite.save
    redirect_to request.referer
  end

  def destroy
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: book.id)
    favorite.destroy
    redirect_to request.referer
  end

  def is_matching_login_user
    favorite = current_user.favorites.find_by(book_id: params[:book_id])
    unless current_user.favorites.exists?(book_id: params[:book_id])
      redirect_to request.referer
    end
  end
end
