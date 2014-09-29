require 'rails_helper'

feature 'user tries to upvote a comic', %Q(

  As a CBN
  I want to be able to upvote or downvote ratings,
  so that I can know which rating for the comic book
  is the most authorative review (and so that I can
    know who the biggest nerd is).

) do
  let(:user) { FactoryGirl.create(:user) }
  let(:comic_book) { FactoryGirl.create(:comic_book) }

  scenario 'user adds review to comic book' do
    sign_in(user)
    visit comic_book_path(comic_book)
    fill_in 'Body', with: 'sample review'
    select(5, from: 'Rating')
    click_button 'Create Rating'
    click_link 'Upvote'

    expect(page).to have_content('Upvote Successful')
  end
end
