require 'rails_helper'
feature 'Update group instance' do
  let!(:user) { FactoryGirl.create(:user)}
  let!(:group) {FactoryGirl.create(:group)}
  scenario 'update group' do
    visit root_path
    click_on "#{group.name}"
    expect(page).to have_content("Edit")
    click_on "Edit"
    expect(page).to have_content("Name")
    fill_in 'Name', with: "New Group Name"
    click_on 'Submit'
    expect(page).to have_content('New Group Name')
  end
end