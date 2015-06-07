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
  end

  factory :grocery_list do
    sequence(:name) { |n| "list item #{n}"}
  end

  factory :grocery_item do
    sequence(:name) { |n| "New Item #{n}"}
    sequence(:quantity) { |n| "#{n}"}
  end

  factory :supply do
    sequence(:item) { |n| "Supply Item #{n}"}
  end
end
