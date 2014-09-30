require 'rails_helper'

feature 'admin can delete comics', %Q(

  As a CBN Admin
  I want to be able to delete a comic book
  So I don't have to look at Capt. Ameriwuss.

) do

  let(:admin) { FactoryGirl.create(:admin) }
  let(:comic_book) { FactoryGirl.create(:comic_book) }

  scenario 'admin can delete comic' do
    sign_in(admin)
    visit comic_book_path(comic_book)

    click_link 'Delete Comic'

    expect(page).to have_content('This comic has been removed.')

  end
end
