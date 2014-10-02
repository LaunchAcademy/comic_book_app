class ComicBook < ActiveRecord::Base

  has_many :reviews

  validates :title, presence: true

  mount_uploader :cover, ComicBookCoverUploader

  def self.search(query)
    where("title ilike ?", "%#{query}%")
  end

  def average_score
    if reviews.length > 0
      average = reviews.sum(:rating)/reviews.length
    else
      average = "No reviews yet!"
    end
  end #end of method
end # end of class
