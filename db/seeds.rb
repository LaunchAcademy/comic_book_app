# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

comic_books = []

options = { headers: :true, col_sep: "\t" }

CSV.foreach("#{Rails.root}/lib/assets/comics.csv", options) do |comic|
  comic_books << comic.to_hash
end


comic_books.each do |comic_attr|
  comic = ComicBook.find_or_initialize_by(barcode: comic_attr["Barcode"] )
  comic.title = comic_attr["Series"]
  comic.issue = comic_attr["Issue No."]
  comic.publisher = comic_attr["Publisher"]
  comic.author = comic_attr["Writer"]
  comic.artist = comic_attr["Cover Artist"]
  comic.description = comic_attr["Plot"]
  comic.save!
end
