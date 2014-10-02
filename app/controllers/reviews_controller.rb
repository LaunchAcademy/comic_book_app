class ReviewsController < ApplicationController
  def create
    @user = current_user
    @comic_book = ComicBook.find(params[:comic_book_id])
    @review = @comic_book.reviews.new(review_params)
    @review.user_id = @user.id

    if @review.save
      flash[:notice] = 'Review Added'
      redirect_to comic_book_path(@comic_book)
    else
      redirect_to comic_book_path(@comic_book), notice: 'There was an error'
    end
  end

  def edit
    @review = review.find(params[:id])
    @comic_book = ComicBook.find(params[:comic_book_id])
  end

  def update
    @review = Review.find(params[:id])
    @comic_book = ComicBook.find(params[:comic_book_id])
    if @review.update(rating_params)
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
