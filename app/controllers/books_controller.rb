class BooksController < ApplicationController

  def index
    @books = Book.all
    render :index
  end

  def show
    @book = Book.find(params[:id])
    @authors = Author.all
    @author_book = AuthorBook.new
    render :show
  end

  def new
    @book = Book.new
    @authors = Author.all
    render :new
  end

  def create
    @book = Book.new(book_params)
     if @book.valid?
       @book.save
       redirect_to book_path(@book)
     else
       flash.now[:error] = @book.errors.full_messages
       @authors = Author.all
       render :new
     end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to book_path
  end

  def edit
    @book = Book.find(params[:id])
    render :edit
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :pages)
  end

end
