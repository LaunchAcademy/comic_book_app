class Ratings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :rating, null: false
      t.text    :body
      t.integer :comic_book_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
