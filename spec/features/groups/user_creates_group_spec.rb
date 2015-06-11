require 'rails_helper'

feature 'user creates group', %Q{
  As a signed up user
  I want to create a group
  So that I can add supplies
} do

  scenario 'user successfully creates a group' do
    user = FactoryGirl.create(:user)

    visit root_path

    sign_in_as(user)

    fill_in "group_name", with: "BBQ"

    click_on "Add"

    expect(page).to have_content("Group added.")
    expect(page).to have_content("BBQ")
    expect(Membership.count).to eq(1)
  end

  scenario 'user unsuccessfully creates a group' do
    user = FactoryGirl.create(:user)

    visit root_path

    sign_in_as(user)

    fill_in "group_name", with: ""

    click_on "Add"

    expect(page).to have_content("Name can't be blank")
  end
end
