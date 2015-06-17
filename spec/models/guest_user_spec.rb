require 'rails_helper'

describe GuestUser do
  it_should_behave_like 'a user'
  let(:user) { GuestUser.new }

  describe "#in_group?" do
    it "should always return false" do
      expect(user.in_group?('group')).to eq false
    end
  end

  describe "#authenticated?" do
    it "should always return false because a GuestUser is not real" do
      expect(user.authenticated?).to eq false
    end
  end
end
