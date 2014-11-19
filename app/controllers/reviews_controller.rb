class ReviewsController < ApplicationController
  def create
    @comic_book = ComicBook.find(params[:comic_book_id])
    @review = @comic_book.reviews.new(review_params)
    @review.user = current_user

    if @review.save
      flash[:notice] = 'Review Added'
    else
      flash[:notice] = 'There was an error'
    end
    redirect_to comic_book_path(@comic_book)
  end

  def edit
    @review = Review.find(params[:id])
    @comic_book = ComicBook.find(params[:comic_book_id])
  end

  def update
    @review = Review.find(params[:id])
    @comic_book = ComicBook.find(params[:comic_book_id])
    if @review.update(review_params)
      redirect_to @comic_book, notice: 'Review Updated!'
    else
      flash[:notice] = 'Could not update. Ask Batman. '
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @comic_book = ComicBook.find(params[:comic_book_id])
    @review.destroy
    flash[:notice] = 'This review has been removed.'
    redirect_to @comic_book
  end

  private

  def review_params
    params.require(:review).permit( :body, :rating )
  end
end # of class
