require 'rails_helper'

feature 'user tries to upvote a comic', %Q(

  As a CBN
  I want to be able to upvote or downvote ratings,
  so that I can know which rating for the comic book is the most authorative review (and so that I can know who the biggest nerd is).

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
      click_button 'Create Rating'

      ##### rating upvote ######

      click_link 'upvote'


      ##########################

      expect(page).to have_content('Upvote Successful')
  end
end
