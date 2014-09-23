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
      flash[:notice] = 'Could not save.'
      render :new
    end
  end # of create

  def show
    @comic_book = ComicBook.find(params[:id])
  end

  def edit
    @comic_book = ComicBook.find(params[:id])
  end

  def update
    @comic_book = ComicBook.find(params[:id])

    if @comic_book.update(comic_book_params)
      redirect_to @comic_book, notice: 'Successfully updated!'
    else
      flash[:notice] = 'Could not update. Ask Batman. '
      render :new
    end
  end

  # def destroy
  #   @comic_book = ComicBook.find(params{:id})
  #   @comic_book.destroy
  #   flash[:notice]='Comic has been destroyed'
  #   redirect_to comic_books_path
  # end


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
