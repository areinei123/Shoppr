require 'rails_helper'

feature 'group index' do
  let!(:group) { FactoryGirl.create(:group) }
  scenario 'see all groups' do
    visit root_path
    expect(page).to have_content(group.name)
  end
end
