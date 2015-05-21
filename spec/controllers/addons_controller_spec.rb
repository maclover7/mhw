require 'rails_helper'

RSpec.describe AddonsController, type: :controller do

  describe "POST #add_link" do
    let(:teacher) { FactoryGirl.create(:teacher) }
    before { sign_in teacher }
    let(:course) { FactoryGirl.create(:course) }

    context "with valid course_link" do
      it "creates a course_link" do
        expect {
          post :add_link, id: course, course_link: FactoryGirl.attributes_for(:course_link)
        }.to change(CourseLink, :count).by(1)
      end

      it "redirects to teacher_root path" do
        post :add_link, id: course, course_link: FactoryGirl.attributes_for(:course_link)
        response.should redirect_to(teacher_root_path)
      end
    end
  end

  describe "DELETE #delete_link" do
    let(:teacher) { FactoryGirl.create(:teacher) }
    before { sign_in teacher }
    let(:course) { FactoryGirl.create(:course) }
    before(:each) { @course_link = FactoryGirl.create(:course_link) }

    context "with valid course_link" do
      it "removes the course_link" do
        expect {
          delete :delete_link, id: course, link_id: @course_link
        }.to change(CourseLink, :count).by(-1)
      end

      it "redirects to the course's path" do
        delete :delete_link, id: course, link_id: @course_link
        response.should redirect_to(course_path(course))
      end
    end
  end

  describe "POST #add_file" do
    let(:teacher) { FactoryGirl.create(:teacher) }
    before { sign_in teacher }
    let(:course) { FactoryGirl.create(:course) }
    let(:course_file) { FactoryGirl.create(:course_file) }

    context "with valid course_file" do
      it "creates a course_file" do
        expect {
          post :add_file, id: course, course_file: FactoryGirl.attributes_for(:course_file)
        }.to change(CourseFile, :count).by(1)
      end

      it "redirects to teacher_root path" do
        post :add_file, id: course, course_file: FactoryGirl.attributes_for(:course_file)
        response.should redirect_to(course_path(course))
      end
    end

    context "with invalid course_file" do
      it "does notcreates a course_file" do
        expect {
          post :add_file, id: course, course_file: FactoryGirl.attributes_for(:course_file, name: nil)
        }.to change(CourseFile, :count).by(0)
      end

      it "redirects to teacher_root path" do
        post :add_file, id: course, course_file: FactoryGirl.attributes_for(:course_file, name: nil)
        response.should redirect_to(teacher_root_path)
      end
    end
  end

  describe "DELETE #delete_file" do
    let(:teacher) { FactoryGirl.create(:teacher) }
    before { sign_in teacher }
    let(:course) { FactoryGirl.create(:course) }
    before(:each) { @course_file = FactoryGirl.create(:course_file) }

    context "with valid course_file" do
      it "removes the course_file" do
        expect {
          delete :delete_file, id: course, file_id: @course_file
        }.to change(CourseFile, :count).by(-1)
      end

      it "redirects to the course's path" do
        delete :delete_file, id: course, file_id: @course_file
        response.should redirect_to(course_path(course))
      end
    end
  end

end
