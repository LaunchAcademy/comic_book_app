class AddTableForVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id, null: false
      t.integer :rating_id, null: false
      t.integer :score, null: false

      t.timestamps
    end

    add_index :votes, [:user_id, :rating_id], unique: true
  end
end
