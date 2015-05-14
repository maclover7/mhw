require 'rails_helper'

RSpec.describe AssignmentsController, type: :controller do

  describe "GET #index" do
    let(:teacher) { FactoryGirl.create(:teacher) }
    before { sign_in teacher }

    it "assigns all assignments as @assignments" do
      assignment = FactoryGirl.create(:assignment)
      get :index
      assigns(:assignments).should eq([assignment])
    end
  end

  describe "GET #show" do
    let(:teacher) { FactoryGirl.create(:teacher) }
    before { sign_in teacher }

    it "assigns the requested assignment as @assignment" do
      assignment = FactoryGirl.create(:assignment)
      get :show, id: assignment
      assigns(:assignment).should eq(assignment)
    end
  end

  describe "GET #new" do
    let(:teacher) { FactoryGirl.create(:teacher) }
    before { sign_in teacher }

    it "assigns a new assignment as @assignment" do
      get :new
      assigns(:assignment).should be_a_new(Assignment)
    end
  end

  describe "GET #edit" do
    let(:teacher) { FactoryGirl.create(:teacher) }
    before { sign_in teacher }

    it "assigns the requested assignment as @assignment" do
      assignment = FactoryGirl.create(:assignment, teacher_id: "1")
      get :edit, id: assignment
      assigns(:assignment).should eq(assignment)
    end

    it "redirects if correct_user is false" do
      assignment = FactoryGirl.create(:assignment, teacher_id: "2")
      get :edit, id: assignment
      response.should redirect_to(root_path)
    end
  end

  describe "POST #create" do
    let(:teacher) { FactoryGirl.create(:teacher) }
    before { sign_in teacher }

    context "with valid params" do
      it "creates a new Assignment" do
        expect {
          post :create, assignment: FactoryGirl.attributes_for(:assignment)
        }.to change(Assignment, :count).by(1)
      end

      it "assigns a newly created assignment as @assignment" do
        post :create, assignment: FactoryGirl.attributes_for(:assignment)
        assigns(:assignment).should be_a(Assignment)
        assigns(:assignment).should be_persisted
      end

      it "redirects to the created assignment" do
        post :create, assignment: FactoryGirl.attributes_for(:assignment)
        response.should redirect_to(Assignment.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved assignment as @assignment" do
        post :create, assignment: FactoryGirl.attributes_for(:assignment, name: nil)
        assigns(:assignment).should be_a_new(Assignment)
      end

      it "re-renders the 'new' template" do
        post :create, assignment: FactoryGirl.attributes_for(:assignment, name: nil)
        response.should render_template("new")
      end
    end
  end

  describe "PUT #update" do
    let(:teacher) { FactoryGirl.create(:teacher) }
    before { sign_in teacher }

    context "with valid params" do
      it "updates the requested assignment" do
        assignment = FactoryGirl.create(:assignment)
        put :update, id: assignment, assignment: FactoryGirl.attributes_for(:assignment, name: "Read page 1")
        assignment.reload
      end

      it "assigns the requested assignment as @assignment" do
        assignment = FactoryGirl.create(:assignment, teacher_id: "1")
        put :update, id: assignment, assignment: FactoryGirl.attributes_for(:assignment, name: "Read page 1")
        assigns(:assignment).should eq(assignment)
      end

      it "redirects to the assignment" do
        assignment = FactoryGirl.create(:assignment, teacher_id: "1")
        put :update, id: assignment, assignment: FactoryGirl.attributes_for(:assignment, name: "Read page 1")
        response.should redirect_to(assignment)
      end
    end

    context "with invalid params" do
      it "assigns the assignment as @assignment" do
        assignment = FactoryGirl.create(:assignment, teacher_id: "1")
        put :update, id: assignment, assignment: FactoryGirl.attributes_for(:assignment, name: nil)
        expect(assigns(:assignment)).to eq(assignment)
      end

      it "re-renders the 'edit' template" do
        assignment = FactoryGirl.create(:assignment, teacher_id: "1")
        put :update, id: assignment, assignment: FactoryGirl.attributes_for(:assignment, name: nil)
        expect(response).to render_template("edit")
      end

      it "redirects if correct_user is false" do
        assignment = FactoryGirl.create(:assignment, teacher_id: "2")
        put :update, id: assignment, assignment: FactoryGirl.attributes_for(:assignment, name: nil)
        response.should redirect_to(root_path)
      end
    end
  end

  describe "DELETE #destroy" do
    let(:teacher) { FactoryGirl.create(:teacher) }
    before { sign_in teacher }

    context "with valid params" do
      it "destroys the requested assignment" do
        assignment = FactoryGirl.create(:assignment, teacher_id: "1")
        expect {
          delete :destroy, id: assignment
        }.to change(Assignment, :count).by(-1)
      end

      it "redirects to the assignments list" do
        assignment = FactoryGirl.create(:assignment, teacher_id: "1")
        delete :destroy, id: assignment
        response.should redirect_to(assignments_url)
      end
    end

    context "with invalid params" do
      it "redirects if correct_user is false" do
        assignment = FactoryGirl.create(:assignment, teacher_id: "2")
        delete :destroy, id: assignment
        response.should redirect_to(root_path)
      end
    end
  end

end
