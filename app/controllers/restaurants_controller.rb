class RestaurantsController < ApplicationController

  def show
    @restaurant = Restaurant.find_by(id: params["id"])
	@is_admin = false
	@is_login = false
	if session["user_id"].present?
		@is_login = true
		if User.find_by(id: session["user_id"]).is_admin
			@is_admin = true
		end
	end	
  end

  def index
    @restaurants = Restaurant.all
	@is_admin = false
	if session["user_id"].present?
		if User.find_by(id: session["user_id"]).is_admin
			@is_admin = true
		end
	end	
  end

  def new
	@restaurant = Restaurant.new
  end

  def edit
    @restaurant = Restaurant.find_by(id: params["id"])
  end

  def create
    @restaurant = Restaurant.new
    @restaurant.name = params["name"]
    @restaurant.address = params["address"]
    @restaurant.table_num = params["table_num"]
    if @restaurant.save
      redirect_to "/", notice: "Add restaurant successfully!"
    else
      #redirect_to "/users/new", notice: "Whoa, nice try!"
      render 'new'
	end
  end

  def update
    @restaurant = Restaurant.find_by(id: params["id"])
    @restaurant.name = params["name"]
    @restaurant.address = params["address"]
    @restaurant.table_num = params["table_num"]
    if @restaurant.save
      redirect_to "/", notice: "Update restaurant successfully!"
    else
      #redirect_to "/users/new", notice: "Whoa, nice try!"
      render 'edit'
	end
  end

  def destroy
    restaurant = Restaurant.find_by(id: params["id"])
    restaurant.destroy
    redirect_to "/"
  end


end
