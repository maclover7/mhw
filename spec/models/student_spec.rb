require "rails_helper"

describe Student, type: :model do

  it "has a valid factory" do
    FactoryGirl.build(:student).should be_valid
  end

  it { should have_many(:enrollments) }
  it { should have_many(:student_assignments) }

  it_should_behave_like "a user"
end
