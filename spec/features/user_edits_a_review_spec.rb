require 'rails_helper'

feature 'user tries to edit review', %Q(

  As a CBN
  I want to edit a review I created
  So I change what i wrote.

) do

  let(:user) { FactoryGirl.create(:user) }

  scenario 'user edits review to comic book' do
  pending 'feature to be implemented'
    review = FactoryGirl.create(:review, user: user)
    sign_in(user)

    visit comic_book_path(review.comic_book)
    click_link 'Edit Review'
    select(1, from: 'Rating')
    click_button 'Update Review'

    expect(page).to have_content('Review Updated')
  end
end # of test
