require 'rails_helper'

RSpec.describe QuizCenterController, type: :controller do

  describe "GET #take" do
    context "active assignment" do
      let(:student) { FactoryGirl.create(:student) }
      before do
        sign_in student
        @course = FactoryGirl.create(:course)
        @enrollment = FactoryGirl.create(:enrollment, course_id: @course.id, student_id: student.id)
        @active_assignment = FactoryGirl.create(:assignment, active: true, course_id: @course.id)
        @student_assignment = FactoryGirl.create(:student_assignment, assignment_id: @active_assignment.id, student_id: student.id)
      end

      it "renders the take template" do
        get :take, id: @active_assignment.id
        response.should render_template 'take'
        response.status.should eq(200)
      end
    end

    context "inactive assignment" do
      let(:student) { FactoryGirl.create(:student) }
      before { sign_in student }
      before { @inactive_assignment = FactoryGirl.create(:assignment, active: false) }

      it "renders the take template" do
        get :take, id: @inactive_assignment.id
        response.should redirect_to(quiz_center_path)
      end
    end
  end

end
