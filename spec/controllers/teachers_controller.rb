require 'rails_helper'

RSpec.describe TeachersController, type: :controller do

  describe "GET #index" do
    let(:teacher) { FactoryGirl.create(:teacher) }
    before { sign_in teacher }

    it "renders the index template" do
      course = FactoryGirl.create(:course, teacher_id: teacher)

      get :index
      response.should render_template 'index'
      response.status.should eq(200)
    end
  end

end
