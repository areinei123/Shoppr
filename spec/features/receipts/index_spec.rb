require 'rails_helper'

feature 'Create a new recipe' do
  let(:group) { FactoryGirl.create(:group_with_grocery_list) }
  let(:user) { FactoryGirl.create(:user) }
  let(:membership) { FactoryGirl.create(:membership, user: user, group: group) }
  let(:receipt) { FactoryGirl.create(:receipt,
                    membership: membership,
                    grocery_list: group.grocery_list
                )}

  scenario 'see all receipts' do
    visit root_path
    sign_in_as user
    click_link group.name
    
  end
end
