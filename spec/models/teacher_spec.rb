require "rails_helper"

describe Teacher, type: :model do

  it "has a valid factory" do
    FactoryGirl.build(:teacher).should be_valid
  end

  it { should have_many(:courses) }

  it_should_behave_like "a user"
end
