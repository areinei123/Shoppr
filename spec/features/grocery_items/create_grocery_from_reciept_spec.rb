require 'rails_helper'

feature 'creating grocery items from an image or a reciept' do
  pending 'authenticated user provides a url for the reciept' do
    user = FactoryGirl.create(:user)
    group = FactoryGirl.create(:group)
    grocery_list = FactoryGirl.create(:grocery_list, :group_id => group.id)
    membership = FactoryGirl.create(:membership, :user_id => user.id, :group_id => group.id)

    visit root_path
    sign_in_as(user)

    click_link group.name

    click_link 'View Receipts'

    fill_in 'Receipt URL', with:'http://livingsuperhuman.com/wp-content/uploads/2012/02/011.jpg'

    click_button 'Add receipt'

    expect(page).to have_content('CELERY HEART')
    expect(page).to have_content('CAULIFLOWER')
    expect(page).to have_content('AVOCADO')
    expect(page).to have_content('ASPARAGUS')
    expect(page).to have_content('SWEET PEPPER')
    expect(page).to have_content('SPAGHETTI')


    click_button 'Create Grocery Items'


  end
end
