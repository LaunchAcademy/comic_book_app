require 'rails_helper'

feature 'user tries to downvote a comic review', %Q(

  As a CBN
  I want to be able to downvote reviews,
  so that I can mock lesser nerds and their ignorant reviews.

) do
  let(:user) { FactoryGirl.create(:user) }

  scenario 'user adds review to comic book' do
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
      select(5, from: 'Rating')
      click_button 'Create Review'

      ##### review upvote ######

      click_link 'Downvote'


      ##########################

      expect(page).to have_content('Downvote Successful.')
  end
end
