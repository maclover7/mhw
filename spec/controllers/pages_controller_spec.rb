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
    it "renders the dashboard_student template" do
      get :dashboard_student
      response.should render_template 'dashboard_student'
      response.status.should eq(200)
    end
  end

  describe "GET #dashboard_teacher" do
    it "renders the dashboard_teacher template" do
      get :dashboard_teacher
      response.should render_template 'dashboard_teacher'
      response.status.should eq(200)
    end
  end

end
