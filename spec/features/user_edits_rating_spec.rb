require 'rails_helper'

feature 'user tries to edit rating', %Q(

  As a CBN
  I want to edit a rating I created
  So I change what i wrote.

) do
  let(:user) { FactoryGirl.create(:user) }

  scenario 'user edits rating to comic book' do
      sign_in(user)
      comic = FactoryGirl.build(:comic_book)

      visit new_comic_book_path
      fill_in 'Title', with: comic.title
      fill_in 'Publisher', with: comic.publisher
      fill_in 'Author', with: comic.author
      fill_in 'Artist', with: comic.artist
      fill_in 'Description', with: comic.description
      click_button 'Create Comic Book'
      fill_in 'Body', with: 'sample review'
      fill_in 'Rating', with: '1'
      click_button 'Create Rating'
      click_link 'Edit Rating'
      fill_in 'Rating', with: '2'

      expect(page).to have_content('Review Updated')
  end
end # of test
