require 'rails_helper'

feature 'membership create' do
  let(:user) { FactoryGirl.create(:user) }
  let!(:group) { FactoryGirl.create(:group) }

  scenario 'join group' do
    visit root_path
    sign_in_as user
    click_link group.name
    click_link "Join Group!"

    expect(Membership.count).to be(1)
  end

  scenario 'cannot join group if not signed in' do
    visit root_path
    click_link group.name
    click_link "Join Group!"

    expect(page).to have_content("You must sign in to join groups")
  end
end
