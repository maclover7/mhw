require 'rails_helper'

RSpec.describe CoursesController, type: :controller do

  describe "GET #index" do
    let(:teacher) { FactoryGirl.create(:teacher) }
    before { sign_in teacher }

    it "renders the index template" do
      course = FactoryGirl.create(:course)
      get :index
      response.should render_template 'index'
      response.status.should eq(200)
    end
  end

  describe "GET #show" do
    context "as a teacher" do
      let(:teacher) { FactoryGirl.create(:teacher) }
      before { sign_in teacher }
      before { @course = FactoryGirl.create(:course, teacher_id: teacher.id) }

      it "assigns the requested course as @course" do
        get :show, id: @course
        @course.should eq(@course)
      end

      it "renders the show template" do
        get :show, id: @course
        response.should render_template 'show'
        response.status.should eq(200)
      end
    end

    context "as a student" do
      let(:student) { FactoryGirl.create(:student) }
      before { sign_in student }
      before { @course = FactoryGirl.create(:course) }
      before { @enrollment = FactoryGirl.create(:enrollment, course_id: @course.id, student_id: student.id) }

      it "assigns the requested course as @course" do
        get :show, id: @course
        @course.should eq(@course)
      end

      it "renders the show template" do
        get :show, id: @course
        response.should render_template 'show'
        response.status.should eq(200)
      end
    end
  end

  describe "GET #new" do
    let(:teacher) { FactoryGirl.create(:teacher) }
    before { sign_in teacher }

    it "assigns a new course as @course" do
      get :new
      assigns(:course).should be_a_new(Course)
    end

    it "renders the new template" do
      get :new
      response.should render_template 'new'
      response.status.should eq(200)
    end
  end

  describe "GET #edit" do
    let(:teacher) { FactoryGirl.create(:teacher) }
    before { sign_in teacher }
    before { @course = FactoryGirl.create(:course, teacher_id: "1") }

    it "assigns the requested course as @course" do
      get :edit, id: @course
      assigns(:course).should eq(@course)
    end

    it "renders the edit template" do
      get :edit, id: @course
      response.should render_template 'edit'
      response.status.should eq(200)
    end

    it "redirects if correct_user is false" do
      @course = FactoryGirl.create(:course, teacher_id: "2")
      get :edit, id: @course
      response.should redirect_to(root_path)
    end
  end

  describe "POST #create" do
    let(:teacher) { FactoryGirl.create(:teacher) }
    before { sign_in teacher }

    context "with valid params" do
      it "creates a new Course" do
        expect {
          post :create, course: FactoryGirl.attributes_for(:course)
        }.to change(Course, :count).by(1)
      end

      it "assigns a newly created course as @course" do
        post :create, course: FactoryGirl.attributes_for(:course)

        assigns(:course).should be_a(Course)
        assigns(:course).should be_persisted
      end

      it "redirects to the created course" do
        post :create, course: FactoryGirl.attributes_for(:course)
        response.should redirect_to(Course.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved course as @course" do
        post :create, course: FactoryGirl.attributes_for(:course, name: "")
        assigns(:course).should be_a_new(Course)
      end

      it "re-renders the 'new' template" do
        post :create, course: FactoryGirl.attributes_for(:course, name: "")
        response.should render_template("new")
      end
    end
  end

  describe "PUT #update" do
    let(:teacher) { FactoryGirl.create(:teacher) }
    before { sign_in teacher }

    context "with valid params" do
      before { @course = FactoryGirl.create(:course, teacher_id: "1") }
      it "updates the requested course" do
        put :update, id: @course, course: FactoryGirl.attributes_for(:course, name: "english")
        @course.reload
      end

      it "assigns the requested course as @course" do
        put :update, id: @course, course: FactoryGirl.attributes_for(:course, name: "english")
        assigns(:course).should eq(@course)
      end

      it "redirects to the course" do
        put :update, id: @course, course: FactoryGirl.attributes_for(:course, name: "english")
        response.should redirect_to(@course)
      end
    end

    context "with invalid params" do
      before { @course = FactoryGirl.create(:course, teacher_id: "1") }
      it "assigns the course as @course" do
        put :update, id: @course, course: FactoryGirl.attributes_for(:course, name: nil)
        assigns(:course).should eq(@course)
      end

      it "re-renders the 'edit' template" do
        put :update, id: @course, course: FactoryGirl.attributes_for(:course, name: nil)
        response.should render_template("edit")
      end

      it "redirects if correct_user is false" do
        @course = FactoryGirl.create(:course, teacher_id: "2")
        put :update, id: @course, course: FactoryGirl.attributes_for(:course, name: nil)
        response.should redirect_to(root_path)
      end
    end
  end

  describe "DELETE #destroy" do
    let(:teacher) { FactoryGirl.create(:teacher) }
    before { sign_in teacher }
    before { @course = FactoryGirl.create(:course, teacher_id: "1") }

    context "with valid params" do
      it "destroys the requested course" do
        expect {
          delete :destroy, id: @course
        }.to change(Course, :count).by(-1)
      end

      it "redirects to the courses list" do
        delete :destroy, id: @course
        response.should redirect_to(courses_url)
      end
    end

    context "with invalid params" do
      it "redirects if correct_user is false" do
        @course = FactoryGirl.create(:course, teacher_id: "2")
        delete :destroy, id: @course
        response.should redirect_to(root_path)
      end
    end
  end

end
