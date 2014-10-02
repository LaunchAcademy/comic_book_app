class RenameRatingsToReviews < ActiveRecord::Migration
  def change
    rename_table :ratings, :reviews
    rename_column :votes, :rating_id, :review_id
  end
end
