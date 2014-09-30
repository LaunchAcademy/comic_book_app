class ComicBook < ActiveRecord::Base

  has_many :ratings

  validates :title, presence: true

  mount_uploader :cover, ComicBookCoverUploader

  def self.search(query)
    where("title ilike ?", "%#{query}%")
  end

  def average_score
    if ratings.length > 0
      average = ratings.sum(:rating)/ratings.length
    else
      average = "No reviews yet!"
    end
  end #end of method
end # end of class
