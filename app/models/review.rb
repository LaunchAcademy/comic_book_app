class Review < ActiveRecord::Base

  belongs_to :comic_book
  belongs_to :user

  has_many :votes

  validates :rating, presence: true
  validates :user, presence: true
  validates :comic_book, presence: true

  def total_score
    votes.sum(:score)
  end

end # of class
