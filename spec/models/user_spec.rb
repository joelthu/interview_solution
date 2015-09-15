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


RSpec.describe UsersController, :type => :controller do
  render_views

  let(:json) { JSON.parse(response.body) }
end

describe "GET /users.json" do
  before do
    get :index, format: :json
  end

  context 'all users' do
    it 'returns the users' do
      expect(json.collect{|l| l["first_name"]}).to include(@user1.first_name)
    end
  end
end

