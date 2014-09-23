class ComicBooksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]


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
      flash[:notice] = 'Could not save.'
    end
  end

  def show
    @comic_book = ComicBook.find(params[:id])
  end

  private

    def comic_book_params
      params.require(:comic_book).permit(:title, :issue, :year,
        :publisher, :author, :artist, :description)
    end

  def authenticate_user!
    unless user_signed_in?
      flash[:notice]='You need to sign in if you want to add a comic.'
      redirect_to new_user_session_path
    end
  end
end # of class
