class Rating < ActiveRecord::Base

  belongs_to :comic_book
  belongs_to :user

  has_many :votes

  validates :rating, presence: true
  validates :user_id, presence: true
  validates :comic_book_id, presence: true

  def total_score
    votes.sum(:score)
  end

end # of class
