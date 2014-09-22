class ComicBook < ActiveRecord::Base
  validates :title, presence: true
end
