class CreateComicBooks < ActiveRecord::Migration
  def change
    create_table :comic_books do |t|
      t.string :title, null: false
      t.string :issue
      t.integer :year
      t.string :publisher
      t.string :author
      t.string :artist
      t.text :description

      t.timestamps
    end
  end
end
