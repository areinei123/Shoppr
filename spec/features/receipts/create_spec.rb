require 'rails_helper'

feature 'receipt create' do
  let(:group) { FactoryGirl.create(:group_with_grocery_list) }
  let(:user) { FactoryGirl.create(:user) }
  let!(:membership) { FactoryGirl.create(:membership, user: user, group: group) }
  scenario 'upload a receipt' do
    visit root_path
    sign_in_as user
    click_link group.name
    click_link "View Receipts"
    attach_file('receipt_field', "#{Rails.root}/spec/support/images/receipt.jpg")
    click_button "Upload New Receipt"

    expect(page).to have_content("Receipt by #{user.full_name}")
  end
end
