shared_examples "a user" do
  let(:user) { FactoryGirl.create(described_class.name.underscore.to_sym) }

  subject { user }

  describe "attributes" do
    it "should respond to attributes" do
      should respond_to :name
      should respond_to :email
      should respond_to :password
      should respond_to :password_confirmation
    end
  end

  context "no name" do
    before do
      user.name = ""
    end

    it "should be valid" do
      should be_valid
    end
  end

  context "no email" do
    before do
      user.email = ""
    end

    it "should not be valid" do
      should_not be_valid
    end
  end

  context "no password" do
    before do
      user.password = ""
    end

    it "should not be valid" do
      should_not be_valid
    end
  end

  context "no password confirmation" do
    before do
      user.password_confirmation = ""
    end

    it "should not be valid" do
      should_not be_valid
    end
  end
end
