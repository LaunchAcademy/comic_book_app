require 'rails_helper'

feature 'user can upload a comic book cover', %Q(

  As a CBN
  I want to upload a cover for the comic_book
  so that I can see the cool cover art.

) do

  let(:user) { FactoryGirl.create(:user) }

  scenario 'user adds comic book' do
    sign_in(user)
    comic = FactoryGirl.build(:comic_book)

    visit new_comic_book_path
    fill_in 'Title', with: comic.title
    fill_in 'Publisher', with: comic.publisher
    fill_in 'Author', with: comic.author
    fill_in 'Artist', with: comic.artist
    fill_in 'Description', with: comic.description
    attach_file 'comic_book_cover', "#{Rails.root}/app/assets/images/deadpool_cover.jpg"
    click_button 'Create Comic Book'


    saved_comic_book = ComicBook.find_by(title: comic.title)
    expect(page).to have_content("Successfully created!")
    expect(page).to have_css("img[src='#{saved_comic_book.cover}']")
  end
end
