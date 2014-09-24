class RatingsController < ApplicationController

  def create
    @comic_book = ComicBook.find(params[:comic_book_id])
    @rating = @comic_book.ratings.new(rating_params)
    @rating.user = current_user


    if @rating.save
      flash[:notice] = 'Review Added'
      redirect_to comic_book_path(@comic_book)
    else
      redirect_to comic_book_path(@comic_book), notice: 'There was an error'
    end


  end # of class



  #########
  private
  #########

  def rating_params
    params.require(:rating).permit( :body, :rating )
  end
end
