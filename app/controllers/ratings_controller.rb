class RatingsController < ApplicationController

  def create
    @user = current_user
    @comic_book = ComicBook.find(params[:comic_book_id])
    @rating = @comic_book.ratings.new(rating_params)
    @rating.user_id = @user.id


    if @rating.save
      flash[:notice] = 'Review Added'
      redirect_to comic_book_path(@comic_book)
    else
      redirect_to comic_book_path(@comic_book), notice: 'There was an error'
    end
  end

  def edit
    @rating = Rating.find(params[:id])
    @comic_book = ComicBook.find(params[:comic_book_id])
  end


## FINISH THIS LATER ##
  # def update
  #   @rating = Rating.find(params[:id])
  #
  #   if @rating.update(rating_params)
  #     redirect_to @comic_book, notice: 'Review Updated'
  #   else
  #     flash[:notice] = 'Could not update. Ask Batman. '
  #     redirect_to @comic_book
  #   end
  # end


  #########
  private
  #########

  def rating_params
    params.require(:rating).permit( :body, :rating )
  end





end # of class
