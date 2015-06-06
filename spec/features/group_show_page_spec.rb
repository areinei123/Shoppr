require 'rails-helper'

feature 'user visits show page' do
  context 'As an authenticated user' do
    before (:each) do
      user = FactoryGirl.create(:user)
      group = FactoryGirl.create(:group)
      visit new_user_session_path

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password

      click_button 'Log in'
    end
    scenario 'I want to be able to view the show page' do
      visit root_path
      click_on group.name
      expect(page).to have_content("#{group.name}")
    end
  end
end
