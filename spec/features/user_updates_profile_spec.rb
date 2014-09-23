require 'rails_helper'

feature 'user updates profile', %Q(

  As an authenticated user
  I want to update my information
  So that I can keep my profile up to date

) do

  scenario 'user changes password' do
    user = FactoryGirl.create(:user)
    sign_in(user)

    visit root_path
    click_link 'Edit profile'
    fill_in 'Current password', with: user.password
    fill_in 'Password', with: 'new_password'
    fill_in 'Password confirmation', with: 'new_password'
    click_button 'Update'

    expect(page).to have_content("updated successfully")
  end

end
