class ComicBook < ActiveRecord::Base
  has_many :ratings

  validates :title, presence: true

  def self.search(query)
    where("title ilike ?", "%#{query}%")
  end
end
