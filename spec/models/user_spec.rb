require "spec_helper"
#require "user"

describe "User" do

#  let!(:user) { User.create }
  
  it "returns a valid call to user create request" do
    user = User.create(:user)
    get "/users/#{user.id}.json"
    expect(response).to be_success

  end

  it "returns an invalid call to user create request" do

    response.should_not be_success

  end  

  it "returns a valid call to user show request" do
    user_show = User.find(params[:id])
    get "/users.json"
    expect(response).to be_success

  end

  it "returns a valid call to user index request" do
    users_index = User.all(:user)
    get "/users/#{user_new.id}"
    expect(response).to be_success

  end


end