require 'rails_helper'

RSpec.describe Assignment, type: :model do

  let(:assignment) { FactoryGirl.create(:assignment) }

  it "has a valid factory" do
    FactoryGirl.build(:assignment).should be_valid
  end

  it { should belong_to(:course) }
  it { should have_many(:student_assignments) }
  it { should belong_to(:teacher) }

  context "with no name" do
    before { assignment.name = nil }
    it { is_expected.not_to be_valid }
  end

  context "with no body" do
    before { assignment.body = "" }
    it { is_expected.not_to be_valid }
  end

  context "with no due_date" do
    before { assignment.due_date = nil }
    it { is_expected.not_to be_valid }
  end

  describe "create_student_assignments!" do
    it "creates a student_assignment" do
    end
  end

  describe "destroy_student_assignments!" do
    it "destroys a student_assignment" do
    end
  end
end
