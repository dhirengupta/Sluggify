require 'spec_helper'

describe User do
  let(:user) { User.create(:name => 'test') }

  it 'should respond to generate_slug method' do
    user.should respond_to(:generate_slug)
    user.slug.should eq('test')
  end
end
