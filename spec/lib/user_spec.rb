require "spec_helper"


describe "#create valid call" do
  
  it "returns a valid call to user create request" do
    user = User.create(:user)
    get "/users/#{user.id}.json"

    expect(response).to be_success

  end

end