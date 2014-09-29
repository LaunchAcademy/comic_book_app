require 'rails_helper'

feature 'admin views a list of users' do

  let!(:user) { FactoryGirl.create(:user) }
  let(:admin) { FactoryGirl.create(:admin) }

  scenario 'admin sees all the users' do
    sign_in(admin)
    visit '/admin/users'
    expect(page).to have_content(user.email)
  end

  scenario 'regular users cannot see all users' do
    sign_in(user)
    visit '/admin/users'
    expect(page).to have_content("Not Authorized")
  end
end
