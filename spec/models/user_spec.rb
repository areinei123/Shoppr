require 'rails_helper'

describe User do
  it_should_behave_like 'a user'

  describe "#full_name" do
    it "should combine the first and last name" do
      user = FactoryGirl.create(:user, first_name: "John", last_name: "Smith")
      expect(user.full_name).to eq "John Smith"
    end
  end

  describe "#in_group?" do
    let(:membership) { FactoryGirl.create(:membership) }
    let(:group) { membership.group }
    let(:user) { membership.user }

    it "returns true if user is in group" do
      expect(user.in_group?(group)).to eq true
    end

    it "returns false if user is not in group" do
      group = FactoryGirl.create(:group)
      expect(user.in_group?(group)).to eq false
    end
  end

  describe "#authenticated?" do
    it "should always return true" do
      user = FactoryGirl.create(:user)
      expect(user.authenticated?).to eq true
    end
  end
end
