class AddCoverToComicBooks < ActiveRecord::Migration
  def change
    add_column :comic_books, :cover, :string
  end
end
