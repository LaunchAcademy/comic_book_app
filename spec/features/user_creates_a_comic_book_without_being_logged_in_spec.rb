require 'rails_helper'

feature 'user tries to create a comic book w/o being logged in', %Q(

  As a CBN
  I want to try to add comic book w/o being logged in
  So I can be notified that i am not logged in and it was not saved.

) do

  scenario 'user adds comic book' do
    visit new_comic_book_path
    expect(page).to have_content('You need to sign in if you want to add a comic.')
  end
end # of test
