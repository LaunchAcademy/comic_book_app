class AddTableForVotes < ActiveRecord::Migration
  def change

    create_table :votes do |t|
      t.integer :user_id, null: false
      t.integer :rating_id, null: false
      t.integer :score, null: false

      t.timestamps
    end

  end
end
