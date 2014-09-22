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

  scenario 'user forgets fields' do
    visit root_path
    click_link 'Sign up'
    click_button 'Sign up'
    expect(page).to have_content("can't be blank")
  end

  scenario 'email already exists' do
    user = User.create(email: 'aquaman@gmail.com',
      password: 'fisharecool123', password_confirmation: 'fisharecool123')

    visit root_path
    click_link 'Sign up'
    fill_in 'Email', with: 'aquaman@gmail.com'
    fill_in 'Password', with: 'secret123'
    fill_in 'Password confirmation', with: 'secret123'
    click_button 'Sign up'

    expect(page).to have_content('Email has already been taken')
  end

  scenario 'passwords do not match' do
    visit root_path
    click_link 'Sign up'

    fill_in 'Email', with: 'captian_america_king@gmail.com'
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '87654321'
    click_button 'Sign up'

    expect(page).to have_content("Password confirmation doesn't match")
  end
end
