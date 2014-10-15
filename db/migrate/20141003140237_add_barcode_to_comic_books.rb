class AddBarcodeToComicBooks < ActiveRecord::Migration
  def change
    add_column :comic_books, :barcode, :string
  end
end
