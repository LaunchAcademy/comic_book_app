class ComicBook < ActiveRecord::Base
  has_many :reviews

  validates :title, presence: true

  mount_uploader :cover, ComicBookCoverUploader

  def self.search(query)
    where("title ilike ?", "%#{query}%")
  end

  def average_score
    return nil if reviews.length <= 0
    return reviews.sum(:rating) / reviews.length
  end #end of method
end # end of class
