require "rails_helper"

feature 'User searches for a comic.', %Q(

  As a CBN
  I want to search for a specific comic.
  So I don't have to filter through endless issues of Capt. Ameriwuss.

) do

  scenario 'user searches for a comic book.' do
    comic = FactoryGirl.create(:comic_book)

    visit root_path

    fill_in 'Search', with: comic.title
    click_button 'Search comics'
    expect(page).to have_content(comic.title)

  end
end
