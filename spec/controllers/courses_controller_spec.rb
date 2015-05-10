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
    let(:teacher) { FactoryGirl.create(:teacher) }
    before { sign_in teacher }

    before { @course = FactoryGirl.create(:course) }
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
    before { @course = FactoryGirl.create(:course) }

    it "assigns the requested course as @course" do
      get :edit, id: @course
      assigns(:course).should eq(@course)
    end

    it "renders the edit template" do
      get :edit, id: @course
      response.should render_template 'edit'
      response.status.should eq(200)
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
      before { @course = FactoryGirl.create(:course) }
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
      before { @course = FactoryGirl.create(:course) }
      it "assigns the course as @course" do
        put :update, id: @course, course: FactoryGirl.attributes_for(:course, name: "")
        assigns(:course).should eq(@course)
      end

      it "re-renders the 'edit' template" do
        put :update, id: @course, course: FactoryGirl.attributes_for(:course, name: "")
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    let(:teacher) { FactoryGirl.create(:teacher) }
    before { sign_in teacher }
    before { @course = FactoryGirl.create(:course) }

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

end
