class ComicBook < ActiveRecord::Base

  has_many :ratings

  validates :title, presence: true

  mount_uploader :cover, ComicBookCoverUploader

  def self.search(query)
    where("title ilike ?", "%#{query}%")
  end

  def average_score
    ratings.rating.sum/ratings.length
  end

end
