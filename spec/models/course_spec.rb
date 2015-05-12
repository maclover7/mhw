require 'rails_helper'

RSpec.describe Course, type: :model do
  let(:course) { FactoryGirl.create(:course) }

  it { should have_many(:assignments) }
  it { should have_many(:enrollments) }
  it { should belong_to(:teacher) }

  it "has a valid factory" do
    FactoryGirl.build(:course).should be_valid
  end

  context "with no teacher" do
    before { course.teacher_id = nil }
    it { is_expected.not_to be_valid }
  end

  context "with no name" do
    before { course.name = "" }
    it { is_expected.not_to be_valid }
  end

  context "with no course code" do
    before { course.course_code = "" }
    it { is_expected.not_to be_valid }
  end

end
