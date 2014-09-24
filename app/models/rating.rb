class Rating < ActiveRecord::Base

  belongs_to :comic_book
  belongs_to :user

  validates :rating, presence: true


end # of class
