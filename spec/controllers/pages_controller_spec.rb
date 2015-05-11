require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  describe "GET #auth" do
    it "renders the auth template" do
      get :auth
      response.should render_template 'auth'
      response.status.should eq(200)
    end
  end

  describe "GET #home" do
    it "renders the home template" do
      get :home
      response.should render_template 'home'
      response.status.should eq(200)
    end
  end

  describe "GET #dashboard_student" do
    let(:student) { FactoryGirl.create(:student) }
    before { sign_in student }

    it "renders the dashboard_student template" do
      course = FactoryGirl.create(:course)
      enrollment = FactoryGirl.create(:enrollment, course_id: course, student_id: student)

      get :dashboard_student
      response.should render_template 'dashboard_student'
      response.status.should eq(200)
    end
  end

  describe "GET #dashboard_teacher" do
    let(:teacher) { FactoryGirl.create(:teacher) }
    before { sign_in teacher }

    it "renders the dashboard_teacher template" do
      course = FactoryGirl.create(:course, teacher_id: teacher)

      get :dashboard_teacher
      response.should render_template 'dashboard_teacher'
      response.status.should eq(200)
    end
  end

end
