require 'rails_helper'

RSpec.describe StudentsController, type: :controller do

  describe "GET #index" do
    let(:student) { FactoryGirl.create(:student) }
    before { sign_in student }

    context "no parameters" do
      it "renders the index template" do
        course = FactoryGirl.create(:course)
        enrollment = FactoryGirl.create(:enrollment, course_id: course.id, student_id: student.id)

        get :index
        response.should render_template 'index'
        response.status.should eq(200)
      end
    end

    context "time == overdue" do
      it "renders the index template" do
        course = FactoryGirl.create(:course)
        enrollment = FactoryGirl.create(:enrollment, course_id: course.id, student_id: student.id)
        assignment = FactoryGirl.create(:assignment, course_id: course.id, due_date: "#{1.day.ago}")
        student_assignment = FactoryGirl.create(:student_assignment, assignment_id: assignment.id, student_id: student.id)

        get :index, time: "overdue"
        response.should render_template 'index'
        response.status.should eq(200)
      end

      it "renders the correct student_assignments" do
        course = FactoryGirl.create(:course)
        enrollment = FactoryGirl.create(:enrollment, course_id: course.id, student_id: student.id)
        assignment = FactoryGirl.create(:assignment, course_id: course.id, due_date: "#{1.day.ago}")
        student_assignment = FactoryGirl.create(:student_assignment, assignment_id: assignment.id, student_id: student.id, completed: nil)
        student_assignment_1 = FactoryGirl.create(:student_assignment, assignment_id: assignment.id, student_id: student.id, completed: true)

        get :index, time: "overdue"
        assigns(:student_assignments).should eq([student_assignment])
        assigns(:student_assignments).should_not eq([student_assignment_1])
      end
    end

    context "time == today" do
      it "renders the index template" do
        course = FactoryGirl.create(:course)
        enrollment = FactoryGirl.create(:enrollment, course_id: course.id, student_id: student.id)
        assignment = FactoryGirl.create(:assignment, course_id: course.id, due_date: "#{Date.today}")
        student_assignment = FactoryGirl.create(:student_assignment, assignment_id: assignment.id, student_id: student.id)

        get :index, time: "today"
        response.should render_template 'index'
        response.status.should eq(200)
      end

      it "renders the correct student_assignments" do
        course = FactoryGirl.create(:course)
        enrollment = FactoryGirl.create(:enrollment, course_id: course.id, student_id: student.id)
        assignment = FactoryGirl.create(:assignment, course_id: course.id, due_date: "#{Date.today}")
        student_assignment = FactoryGirl.create(:student_assignment, assignment_id: assignment.id, student_id: student.id)

        get :index, time: "today"
        assigns(:student_assignments).should eq([student_assignment])
      end
    end

    context "time == tomorrow" do
      it "renders the index template" do
        course = FactoryGirl.create(:course)
        enrollment = FactoryGirl.create(:enrollment, course_id: course.id, student_id: student.id)
        assignment = FactoryGirl.create(:assignment, course_id: course.id, due_date: "#{Date.tomorrow}")
        student_assignment = FactoryGirl.create(:student_assignment, assignment_id: assignment.id, student_id: student.id)

        get :index, time: "tomorrow"
        response.should render_template 'index'
        response.status.should eq(200)
      end

      it "renders the correct student_assignments" do
        course = FactoryGirl.create(:course)
        enrollment = FactoryGirl.create(:enrollment, course_id: course.id, student_id: student.id)
        assignment = FactoryGirl.create(:assignment, course_id: course.id, due_date: "#{Date.tomorrow}")
        student_assignment = FactoryGirl.create(:student_assignment, assignment_id: assignment.id, student_id: student.id)

        get :index, time: "tomorrow"
        assigns(:student_assignments).should eq([student_assignment])
      end
    end

    context "time == week" do
      it "renders the index template" do
        course = FactoryGirl.create(:course)
        enrollment = FactoryGirl.create(:enrollment, course_id: course.id, student_id: student.id)
        assignment = FactoryGirl.create(:assignment, course_id: course.id, due_date: "#{Date.today.beginning_of_week}")
        student_assignment = FactoryGirl.create(:student_assignment, assignment_id: assignment.id, student_id: student.id)

        get :index, time: "week"
        response.should render_template 'index'
        response.status.should eq(200)
      end

      it "renders the correct student_assignments" do
        course = FactoryGirl.create(:course)
        enrollment = FactoryGirl.create(:enrollment, course_id: course.id, student_id: student.id)
        assignment = FactoryGirl.create(:assignment, course_id: course.id, due_date: "#{Date.today.beginning_of_week}")
        student_assignment = FactoryGirl.create(:student_assignment, assignment_id: assignment.id, student_id: student.id)

        get :index, time: "week"
        assigns(:student_assignments).should eq([student_assignment])
      end
    end

    context "time == next_2_weeks" do
      it "renders the index template" do
        course = FactoryGirl.create(:course)
        enrollment = FactoryGirl.create(:enrollment, course_id: course.id, student_id: student.id)
        assignment = FactoryGirl.create(:assignment, course_id: course.id, due_date: "#{Date.today + 7.days}")
        student_assignment = FactoryGirl.create(:student_assignment, assignment_id: assignment.id, student_id: student.id)

        get :index, time: "next_2_weeks"
        response.should render_template 'index'
        response.status.should eq(200)
      end

      it "renders the correct student_assignments" do
        course = FactoryGirl.create(:course)
        enrollment = FactoryGirl.create(:enrollment, course_id: course.id, student_id: student.id)
        assignment = FactoryGirl.create(:assignment, course_id: course.id, due_date: "#{Date.today + 7.days}")
        student_assignment = FactoryGirl.create(:student_assignment, assignment_id: assignment.id, student_id: student.id)

        get :index, time: "next_2_weeks"
        assigns(:student_assignments).should eq([student_assignment])
      end
    end

    context "time == all" do
      it "renders the index template" do
        course = FactoryGirl.create(:course)
        enrollment = FactoryGirl.create(:enrollment, course_id: course.id, student_id: student.id)
        assignment = FactoryGirl.create(:assignment, course_id: course.id, due_date: "#{Date.today}")
        student_assignment = FactoryGirl.create(:student_assignment, assignment_id: assignment.id, student_id: student.id)

        get :index, time: "all"
        response.should render_template 'index'
        response.status.should eq(200)
      end

      it "renders the correct student_assignments" do
        course = FactoryGirl.create(:course)
        enrollment = FactoryGirl.create(:enrollment, course_id: course.id, student_id: student.id)
        assignment = FactoryGirl.create(:assignment, course_id: course.id, due_date: "#{Date.today}")
        student_assignment = FactoryGirl.create(:student_assignment, assignment_id: assignment.id, student_id: student.id, completed: nil)

        get :index, time: "all"
        assigns(:student_assignments).should eq([student_assignment])
      end
    end
  end

  describe "GET #quiz_center" do
    let(:student) { FactoryGirl.create(:student) }
    before { sign_in student }
    
    it "renders the quiz_center template" do
      get :quiz_center
      response.should render_template 'quiz_center'
      response.status.should eq(200)
    end
  end
end
