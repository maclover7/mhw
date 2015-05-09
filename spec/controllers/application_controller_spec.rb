require "rails_helper"

describe ApplicationController do
  describe "custom user methods" do
    describe "when logged in as a student" do
      let(:student) { FactoryGirl.create(:student) }
      before do
        sign_in student
      end

      it "returns current_student" do
        controller.current_student.should eq(student)
        controller.student_signed_in?.should eq(true)
      end

      it "does not return current_teacher" do
        controller.current_teacher.should eq(nil)
        controller.teacher_signed_in?.should be(false)
      end
    end

    describe "when logged in as a teacher" do
      let(:teacher) { FactoryGirl.create(:teacher) }
      before { sign_in teacher }

      it "returns current_teacher" do
        controller.current_teacher.should eq(teacher)
        controller.teacher_signed_in?.should eq(true)
      end

      it "does not return current_student" do
        controller.current_student.should eq(nil)
        controller.student_signed_in?.should be(false)
      end
    end
  end
end
