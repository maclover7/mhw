require 'rails_helper'

RSpec.describe Course, type: :model do

  it "has a valid factory" do
    FactoryGirl.build(:course).should be_valid
  end

end
