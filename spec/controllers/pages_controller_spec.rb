require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  describe "GET #sign_up_selection" do
    it "returns 200" do
      get :sign_up_selection
      response.status.should eq(200)
    end
  end

end
