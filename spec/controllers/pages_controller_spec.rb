require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  describe "GET #auth" do
    it "renders the auth template" do
      get :auth
      response.should render_template 'auth'
      response.status.should eq(200)
    end
  end

end
