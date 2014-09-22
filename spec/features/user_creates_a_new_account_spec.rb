require 'rails_helper'

feature 'user creates a new account', %Q(

  As a prospective user
  I want to create an account
  So that I can post items and review them

) do

  # Acceptance Criteria
  # * Fill in email and password
  # * A new user account is created if the
  # email isn't already in the database
  # * Password and password confirmation
  # must match
  # * If I fill out the form incorrectly,
  # errors are displayed.

  scenario 'user signs up' do
    visit root_path
    click_link 'Sign up'

    fill_in 'Email', with: 'batman_rules@gmail.com'
    fill_in 'Password', with: 'batcave99'
    fill_in 'Password confirmation', with: 'batcave99'
    click_button 'Sign up'

    expect(page).to have_content("Welcome! You have signed up successfully.")
  end
end
