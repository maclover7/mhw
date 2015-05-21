require 'rails_helper'

RSpec.describe StudentsController, type: :controller do

  describe "GET #index" do
    let(:student) { FactoryGirl.create(:student) }
    before { sign_in student }

    it "renders the index template" do
      course = FactoryGirl.create(:course)
      enrollment = FactoryGirl.create(:enrollment, course_id: course, student_id: student)

      get :index
      response.should render_template 'index'
      response.status.should eq(200)
    end
  end

end
