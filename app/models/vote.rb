class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :review

  validates :user, presence: true
  validates :review, presence: true

  validates_uniqueness_of :review, scope: :user

  validates :score, numericality: { inclusion: { in: [-1, 1] } }
end
