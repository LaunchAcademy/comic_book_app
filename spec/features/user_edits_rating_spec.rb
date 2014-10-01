require 'rails_helper'

feature 'user tries to edit rating', %Q(

  As a CBN
  I want to edit a rating I created
  So I change what i wrote.

) do
  let(:user) { FactoryGirl.create(:user) }
  let(:comic_book) { FactoryGirl.create(:comic_book) }
  let(:other_user) { FactoryGirl.create(:user) }

  scenario 'user edits rating to comic book' do
      sign_in(user)

      visit comic_book_path(comic_book)
      fill_in 'Body', with: 'sample review'
      select(3, from: 'Rating')
      click_button 'Create Rating'
      click_link 'Edit Rating'
      select(5, from: 'Rating')
      click_button 'Update Rating'

      expect(page).to have_content('Review Updated!')
  end

  scenario 'another user cannot edit a review he/she did not write' do
      sign_in(user)

      visit comic_book_path(comic_book)
      fill_in 'Body', with: 'sample review'
      select(3, from: 'Rating')
      click_button 'Create Rating'
      click_link 'Edit Rating'
      select(5, from: 'Rating')
      click_button 'Update Rating'

      sign_out(user)
      sign_in(other_user)

      visit comic_book_path(comic_book)

      expect(page).to have_no_content('Edit Rating')

  end
end # of test
