require 'rails_helper'

feature 'user can delete account', %Q(

  As an authenticated user
  I want to delete my account
  So that my information is no longer retained by the app

) do

  scenario 'user deletes account' do
    user = FactoryGirl.create(:user)

    visit root_path
    click_link 'Sign in'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'

    click_link 'Edit profile'
    click_button 'Annihilate it!'

    expect(page).to have_content('Your account was destroyed')


  end

end

