require 'rails_helper'

feature 'user visits show page' do
  let(:user) {FactoryGirl.create(:user)}
  let!(:group) {FactoryGirl.create(:group)}
  context 'As an authenticated user' do
    scenario 'I want to be able to view the show page' do
      visit root_path
      sign_in_as(user)
      click_on group.name
      expect(page).to have_content("#{group.name}")
    end
  end
end
