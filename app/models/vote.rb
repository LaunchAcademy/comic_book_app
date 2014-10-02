class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :review

  validates :user_id, presence: true
  validates :review_id, presence: true

  validates_uniqueness_of :review, scope: :user

  validates :score, numericality: { inclusion: { in: [-1, 1] } }
end
