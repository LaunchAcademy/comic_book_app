require 'rails_helper'

feature 'user can add comic book', %Q(

  As a CBN
  I want to add a new comic book
  So I can warn others not to read Capt. Ameriwuss

) do

  let(:user) { FactoryGirl.create(:user) }

  scenario 'user adds comic book' do
    sign_in(user)
    comic = FactoryGirl.build(:comic_book)
    ActionMailer::Base.deliveries = []

    visit new_comic_book_path
    fill_in 'Title', with: comic.title
    fill_in 'Publisher', with: comic.publisher
    fill_in 'Author', with: comic.author
    fill_in 'Artist', with: comic.artist
    fill_in 'Description', with: comic.description
    click_button 'Create Comic Book'

    expect(page).to have_content("Successfully created!")
    expect(ActionMailer::Base.deliveries.size).to eql(1)
    last_email = ActionMailer::Base.deliveries.last
  end
end
