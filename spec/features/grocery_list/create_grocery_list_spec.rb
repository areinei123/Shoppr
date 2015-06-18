require 'rails_helper'

feature 'user creates grocery list' do
  scenario 'authenticated user in a group creates grocery list' do
    group = FactoryGirl.create(:group)
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    click_link "#{group.name}"

    fill_in 'Name', with: 'Fourth of July BBQ'
    click_button 'Create List'

    expect(page).to have_content('Fourth of July BBQ')
  end
end
