require 'rails_helper'

feature 'show grocery items', %Q{
  As a signed up user
  I want to see a list of grocery items
  So that I can tell what the list is composed of
} do

  scenario 'user sees list of items in list' do
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
  end
end
