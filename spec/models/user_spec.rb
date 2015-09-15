require "rails_helper"

describe User do

  let(:user) { User.create(id: 1, first_name: 'Abe', last_name: 'Atkins', email: 'aatkins@gmail.com', social_security_number: '111223333') }

  it "returns a valid user upon create request" do
    user.should be_valid
  end

  it 'responds to first name' do
    should respond_to(:first_name) 
  end

end

describe UsersController, :type => :controller do
  describe "GET index" do
    it "returns a 200" do
      get :index, format: :json
      response.should be_successful
    end   
  end
end

