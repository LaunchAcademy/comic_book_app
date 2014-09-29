require 'rails_helper'

feature 'user can see only 10 comics on a page', %Q(

  As a CBN
  I want to only see 10 comics per page
  So I don't have to sort through too much Capt. Ameriwuss.

) do

  scenario 'user only can see 10 comics per page' do
    20.times { FactoryGirl.create(:comic_book) }

    visit comic_books_path

    expect(page).to have_selector('.comic-index-list', count: 10)

  end
end
