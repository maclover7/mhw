require 'rails_helper'

RSpec.describe CourseFile, type: :model do
  let(:course_file) { FactoryGirl.create(:course_file) }

  it { should belong_to(:course) }

  it "has a valid factory" do
    FactoryGirl.build(:course_file).should be_valid
  end

  it { should have_attached_file(:file) }
  it { should validate_attachment_content_type(:file).
    allowing('image/gif', 'image/png', 'application/pdf').
    rejecting('text/plain', 'text/xml') }
end
