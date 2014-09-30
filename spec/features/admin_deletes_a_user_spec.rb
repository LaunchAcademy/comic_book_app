require 'rails_helper'

feature 'admin can delete users' do

  let!(:user) { FactoryGirl.create(:user) }
  let(:admin) { FactoryGirl.create(:admin) }

  scenario 'admin sees all the users' do
    sign_in(admin)
    visit admin_user_path(user)
    click_link 'Delete User'
    expect(page).to have_content "This punk has been removed."
  end
end
