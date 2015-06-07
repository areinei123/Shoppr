require 'rails_helper'

feature 'receipt create' do
  let(:group) { FactoryGirl.create(:group_with_grocery_list) }
  let(:user) { FactoryGirl.create(:user) }
  let(:membership) { FactoryGirl.create(:membership, user: user, group: group) }
  scenario 'upload a receipt' do
    visit_  r


  end
end
