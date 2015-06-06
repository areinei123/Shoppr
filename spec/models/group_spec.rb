require 'rails_helper'

describe Group do
  # it { should have_many :memberships }
  # it { should have_many :users }
  # it { should have_many :grocery_lists }

  it { should have_valid(:name).when("Launch Academy") }
  it { should_not have_valid(:name).when("", nil) }
end
