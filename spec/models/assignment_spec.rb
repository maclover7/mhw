require 'rails_helper'

RSpec.describe Assignment, type: :model do

  it { should belong_to(:course) }
  it { should belong_to(:teacher) }

  it "has a valid factory" do
    FactoryGirl.build(:assignment).should be_valid
  end
end
