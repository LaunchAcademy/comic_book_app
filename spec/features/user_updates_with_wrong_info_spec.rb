require 'rails_helper'

feature 'user adds a comic, then tries to edit it. ', %Q(

  As a CBN
  I want to know if I added incorrect data
  So I can see an error message about , and speak with Batman.

) do

  scenario 'user adds comic book, then tries to edit it' do
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
    click_link 'Edit Comic'
    fill_in 'Title', with: ''
    click_button 'Update Comic Book'
    expect(page).to have_content('Could not update. Ask Batman.')
  end
end # of test
