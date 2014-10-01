require 'rails_helper'

feature 'user tries to delete rating', %Q(

  As a CBN
  I want to delete a rating I created
  So I can stop wasting my time on Capt. Ameriwuss.

) do
  let(:user) { FactoryGirl.create(:user) }
  let(:comic_book) { FactoryGirl.create(:comic_book) }

  scenario 'user delets a rating' do
      sign_in(user)

      visit comic_book_path(comic_book)
      fill_in 'Body', with: 'sample review'
      select(3, from: 'Rating')
      click_button 'Create Rating'
      click_link 'Delete Rating'


      expect(page).to have_content('This rating has been removed.')
  end
end # of test
