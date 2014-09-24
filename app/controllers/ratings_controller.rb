class RatingsController < ApplicationController

  def create
    @comic_book = ComicBook.find(params[:comic_book_id])
    @review = @comic_book.reviews.new(rating_params)

    if @review.save
      flash[:notice] = 'Review Added'
      redirect_to comic_book_path(@comic_book)
    else
      flash[:notice] = 'There was an error'
      redirect_to comic_book_path(@comic_book)
    end
  end # of class



  #########
  private
  #########

  def rating_params
    params.require(:ratings).permit(:body, :rating)
  end
end
