class UsersController < ApplicationController

  def new
    @user = User.new
  end  

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to "/user.json"
    else
      render :new
    end
  end

  def index
    @users = User.all.order('created_at DESC')
  end

  def show
    @user = User.find(params[:id])
    if params[:search]
      @users = User.search(params[:search]).order("created_at DESC")
    end
  end


  private 

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :social_security_number)
  end

end
