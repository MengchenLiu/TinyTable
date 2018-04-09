class UsersController < ApplicationController

  def new
    @user = User.new
  end
  
  def show
    @user = User.find_by(id: params["id"])
    if @user.id != session["user_id"]
      redirect_to "/", notice: "Only login user can see this page!"
    end

  end

  def edit
    @user = User.find_by(id: params["id"])
  end

  def create
    @user = User.new
    @user.name = params["name"]
    @user.password = params["password"]
	@user.email = params["email"]
	@user.phone_number = params["phone_number"]
    if @user.save
		session["user_id"] = @user.id 
		redirect_to "/", notice: "Thanks for signing up,#{@user.name}! You can make a reservation now!"
    else
      render 'new'
    end
  end
  
  def update
    @user = User.find_by(id: params["id"])
    @user.name = params["name"]
	@user.email = params["email"]
	@user.phone_number = params["phone_number"]
    if @user.save
		redirect_to "/users/#{@user.id}", notice: "Profile change successfully,#{@user.name}!"
    else
      render 'edit'
    end
  end
end
