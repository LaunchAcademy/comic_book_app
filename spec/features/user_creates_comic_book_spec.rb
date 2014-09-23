require 'rails_helper'

feature 'user can add comic book', %Q(

  As a CBN
  I want to add a new comic book
  So I can warn others not to read Capt. Ameriwuss

) do

  let(:user) { FactoryGirl.create(:user) }

  scenario 'user adds comic book' do
    login_as(user)
    comic = FactoryGirl.build(:comic_book)

    visit new_comic_book_path
    fill_in 'Title', with: comic.title
    fill_in 'Publisher', with: comic.publisher
    fill_in 'Author', with: comic.author
    fill_in 'Artist', with: comic.artist
    fill_in 'Description', with: comic.description
    click_button 'Create Comic Book'

    expect(page).to have_content("Successfully created!")
  end
end
