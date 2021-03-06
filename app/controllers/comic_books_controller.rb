class ComicBooksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @comic_books = ComicBook.page(params[:page]).per(10).order(:title, :issue)
  end

  def search
    @comic_books = ComicBook.search(params[:search]).page(params[:page]).per(10)
    if @comic_books.empty?
      flash[:notice] = 'Could not find thy query'
    end
    render :index
  end

  def new
    @comic_book = ComicBook.new
  end

  def create
    @comic_book = ComicBook.new(comic_book_params)

    if @comic_book.save
      redirect_to @comic_book, notice: 'Successfully created!'
      UserMailer.created_comic_email(current_user).deliver
    else
      flash[:notice] = 'Could not save.'
      render :new
    end
  end # of create

  def show
    @comic_book = ComicBook.find(params[:id])
    @reviews = @comic_book.reviews.sort_by { |review| review.total_score }.reverse
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

  def destroy
    @comic_book = ComicBook.find(params[:id])
    @comic_book.destroy
    flash[:notice] = 'This comic has been removed.'
    redirect_to comic_books_path
  end

  private
    def comic_book_params
      params.require(:comic_book).permit(
        :title,
        :issue,
        :year,
        :publisher,
        :author,
        :artist,
        :description,
        :cover
      )
    end

    def authenticate_user!
      unless user_signed_in?
        flash[:notice] = 'You need to sign in if you want to add a comic.'
        redirect_to new_user_session_path
      end
    end # of method
end # of class
