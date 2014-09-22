require 'rails_helper'

feature 'authenticated user may sign in', %Q(

As an unauthenticated user
I want to sign in
So that I can post items and review them

) do

  scenario 'user signs in' do
    user = FactoryGirl.create(:user)

    visit root_path
    click_link 'Sign in'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'

    expect(page).to have_content("Signed in successfully.")
  end

end
