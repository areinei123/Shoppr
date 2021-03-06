require 'rails_helper'
feature 'Destroy group instance' do
  let!(:user) { FactoryGirl.create(:user)}
  let!(:group) {FactoryGirl.create(:group)}
  scenario 'destroy group' do
    visit root_path
    click_on group.name
    expect(page).to have_content("Delete Group")
    click_on "Delete Group"
    current_path.should == root_path
  end
end
