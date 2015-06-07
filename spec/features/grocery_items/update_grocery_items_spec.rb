require 'rails_helper'

feature 'update grocery items', %Q{
  As a signed up user
  I want to update a grocery item
  So that it shows correct information
} do

  scenario 'user updates an item in list' do
    user  = FactoryGirl.create(:user)
    group = FactoryGirl.create(:group)
    list  = FactoryGirl.create(:grocery_list, group_id: group.id)
    item  = FactoryGirl.create(:grocery_item, grocery_list_id: list.id)

    visit root_path

    sign_in_as(user)

    click_on group.name
    expect(page).to have_content(list.name)
    expect(page).to have_content(item.name)
    expect(page).to have_content(item.quantity)

    click_on "Edit Item"

    fill_in "Name", with: "BBQ Sauce"
    click_on "Update"

    expect(page).to have_content("BBQ Sauce")
  end
end
