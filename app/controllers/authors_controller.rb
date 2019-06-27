class AuthorsController < ApplicationController

  def index
    @authors = Author.all
    render :index
  end

  def show
    @author = Author.find(params[:id])
    render :show
  end

  def new
    @author = Author.new
    render :new
  end

  def create
    @author = Author.new(author_params)
     if @author.valid?
       @author.save
       redirect_to author_path(@author)
     else
       render :new
     end
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy
    redirect_to authors_path
  end

  def edit
    @author = Author.find(params[:id])
    render :edit
  end

  def update
    @author = Author.find(params[:id])
    if @author.update(author_params)
      redirect_to author_path(@author)
    else
      render :edit
    end
  end

  private

  def author_params
    params.require(:author).permit(:name, :birth_year)
  end

end
