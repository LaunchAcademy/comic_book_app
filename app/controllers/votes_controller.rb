class VotesController < ApplicationController

  def upvote
   vote(1)
  end

  def downvote
    vote(-1)
  end

  def vote(value)
    @vote = Vote.find_or_initialize_by(user_id: current_user.id, review_id: params[:id])
    @vote.score = value

    if value == 1
      type = "Upvote"
    else
      type = "Downvote"
    end

    if @vote.save
      redirect_to @vote.review.comic_book, notice: "#{type} Successful."
    else
      redirect_to @vote.review.comic_book, notice: "#{type} failed."
    end
  end
end
