require 'rails_helper'

feature 'user tries to delete review', %Q(

  As a CBN
  I want to delete a rating I created
  So I can stop wasting my time on Capt. Ameriwuss.

) do
  let(:user) { FactoryGirl.create(:user) }
  let(:comic_book) { FactoryGirl.create(:comic_book) }

  scenario 'user delets a review' do
      sign_in(user)

      visit comic_book_path(comic_book)
      fill_in 'Body', with: 'sample review'
      select(3, from: 'Review')
      click_button 'Create Review'
      click_link 'Delete Review'


      expect(page).to have_content('This review has been removed.')
  end
end # of test
