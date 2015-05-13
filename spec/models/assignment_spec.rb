require 'rails_helper'

RSpec.describe Assignment, type: :model do

  let(:assignment) { FactoryGirl.create(:assignment) }

  it "has a valid factory" do
    FactoryGirl.build(:assignment).should be_valid
  end

  it { should belong_to(:course) }
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
end
