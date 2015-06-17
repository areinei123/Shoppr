RSpec.shared_examples_for 'a user' do
  let(:user) { described_class.new }
  it { expect(user).to respond_to(:authenticated?) }
  it { expect(user).to respond_to(:in_group?) }
end
