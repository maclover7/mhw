require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  describe "GET #auth" do
    it "renders the auth template" do
      get :auth
      response.should render_template 'auth'
      response.status.should eq(200)
    end
  end

  describe "GET #help" do
    it "renders the help template" do
      get :help
      response.should render_template 'help'
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

end
