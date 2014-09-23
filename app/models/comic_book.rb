class ComicBook < ActiveRecord::Base
  has_many :ratings

  validates :title, presence: true
end
