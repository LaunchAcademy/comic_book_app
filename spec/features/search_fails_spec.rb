require 'rails_helper'

feature 'User searches for a comic that does not exist.', %Q(

  As a CBN
  I want to be notified if my search fails.
  So I know that I can upload it and TROLL.

) do

  scenario 'user is notified when search fails.' do

    visit root_path

    fill_in 'search', with: '393urjiodjf903uf9'
    click_button 'Search'
    expect(page).to have_content('Could not find thy query')

  end
end
