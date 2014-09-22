class ComicBooksController < ApplicationController

  def index
    @comic_books = ComicBook.all
  end

  def new
    @comic_book = ComicBook.new
  end

  def create
    @comic_book = ComicBook.new(comic_book_params)

    if @comic_book.save
      redirect_to @comic_book, notice: 'Successfully created!'
    else
      render :new
      flash[:notice]='Could not save.'
    end
  end

  def show
    @comic_book = ComicBook.find(params[:id])
  end




  private

  def comic_book_params
    params.require(:comic_book).permit(:title, :issue, :year, :publisher, :author, :artist, :description)
  end






end # of class
