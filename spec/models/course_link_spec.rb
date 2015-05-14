require 'rails_helper'

RSpec.describe CourseLink, type: :model do
  let(:course_link) { FactoryGirl.create(:course_link) }

  it { should belong_to(:course) }

  it "has a valid factory" do
    FactoryGirl.build(:course_link).should be_valid
  end
end
