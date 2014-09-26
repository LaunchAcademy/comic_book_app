class VotesController < ApplicationController

  def upvote
    @vote = Vote.find_or_initialize_by(user_id: current_user.id, rating_id: params[:id])
    # @vote.user = current_user
    # @vote.rating = Rating.find(params[:id])
    @vote.score = 1

    if @vote.save
      redirect_to @vote.rating.comic_book, notice: "Upvote Successful."
    else
      redirect_to @vote.rating.comic_book, notice: "Upvote failed."
    end
  end

  def downvote
    @vote = Vote.new
    @vote.user = current_user
    @vote.rating = Rating.find(params[:id])
    @vote.score = -1

    if @vote.save
      redirect_to @vote.rating.comic_book, notice: "Downvote Successful."
    else
      redirect_to @vote.rating.comic_book, notice: "Downvote failed."
    end
  end
end
