require 'rails_helper'

RSpec.describe StudentAssignment, type: :model do
  let(:student_assignment) { FactoryGirl.create(:student_assignment) }

  it { should belong_to(:assignment) }
  it { should belong_to(:student) }

  it "has a valid factory" do
    FactoryGirl.build(:student_assignment).should be_valid
  end
end
