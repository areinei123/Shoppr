require 'rails_helper'

feature 'see all receipts' do
  let(:group) { FactoryGirl.create(:group_with_grocery_list) }
  let(:user) { FactoryGirl.create(:user) }
  let!(:membership) { FactoryGirl.create(:membership, user: user, group: group) }
  let(:receipt) { FactoryGirl.create(:receipt,
                    membership: membership,
                    grocery_list: group.grocery_lists.first
                )}

  scenario 'see all receipts' do
    receipt

    visit root_path
    sign_in_as user
    click_link group.name
    click_link "View Receipts"

    expect(page).to have_content("Receipt by #{user.full_name}")
  end
end
