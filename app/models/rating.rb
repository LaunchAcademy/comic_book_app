class Rating < ActiveRecord::Base

  belongs_to :comic_book
  belongs_to :user

  validates :rating, presence: true
  validates :user_id, presence: true
  validates :comic_book_id, presence: true

end # of class
