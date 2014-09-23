require 'rails_helper'

feature 'user adds a comic, then destroys it ', %Q(

  As a CBN
  I want to be able to delete a comic
  So that it will not longer be in the system.

) do

  scenario 'user tries to destroy comic' do
    user = FactoryGirl.create(:user)
    comic = FactoryGirl.create(:comic_book)

    visit root_path
    click_link 'Sign in'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'

    visit new_comic_book_path

    fill_in 'Title', with: comic.title
    fill_in 'Publisher', with: comic.publisher
    fill_in 'Author', with: comic.author
    fill_in 'Artist', with: comic.artist
    fill_in 'Description', with: comic.description
    click_button 'Create Comic Book'
    click_link 'Delete Comic'
    expect(page).to have_content('This comic has been removed.')
  end
end # of test
