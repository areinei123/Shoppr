require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    first_name 'Joe'
    last_name 'Shmoe'
    password 'password'
    password_confirmation 'password'
  end

  factory :group do
    sequence(:name) { |n| "group #{n}" }
    factory :group_with_grocery_list do
      after(:create) do |group|
        FactoryGirl.create(:grocery_list, group: group)
      end
    end
  end

  factory :membership do
    user
    group
  end

  factory :grocery_list do
    sequence(:name) { |n| "New List #{n}"}
  end

  factory :receipt do
    photo "#{Rails.root}/spec/support/images/receipt.jpg"
    membership
    grocery_list
  end
end
