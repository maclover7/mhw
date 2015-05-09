require 'rails_helper'

RSpec.describe User, type: :model do

  it "has a valid factory" do
    FactoryGirl.build(:user).should be_valid
  end

  it_should_behave_like "a user"
end
