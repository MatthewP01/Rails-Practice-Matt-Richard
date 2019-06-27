class AuthorBooksController < ApplicationController

  def create
    @author_book = AuthorBook.create(ab_params)
    redirect_to book_path(@author_book.book)
  end

  private
  def ab_params
    params.require(:author_book).permit(:book_id, :author_id)
  end

end
