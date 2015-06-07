require 'rails_helper'
feature 'Update group instance' do
  let!(:user) { FactoryGirl.create(:user)}
  let!(:group) {FactoryGirl.create(:group)}
  let!(:grocery_list) {FactoryGirl.create(:grocery_list, group_id: group.id)}
  scenario 'update group' do
    visit root_path
    click_on "#{group.name}"
    expect(page).to have_content("Delete List")
    click_on "Delete List"
    expect(page).to_not have_content("#{grocery_list.name}")
  end
end