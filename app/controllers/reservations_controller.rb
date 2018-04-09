class ReservationsController < ApplicationController

  def index
    @reservations = Reservation.all
	@is_admin = false
	if session["user_id"].present?
		if User.find_by(id: session["user_id"]).is_admin
			@is_admin = true
		end
	end
  end

  def new
	@reservation = Reservation.new
  end
  def show
	
  end
  def create

	@reservation = Reservation.new
    @reservation.user_id = session["user_id"]
    @reservation.restaurant_id = params["rest_id"]
	@reservation.time = params["time"]
	@reservation.size = params["num"]
    if @reservation.save
		user = User.find_by(id:session["user_id"])
		#use to send text confirmation
		customer_phone = user.phone_number
		user.point = user.point+ params["num"].to_i
		user.save
		account_sid = 'AC4e0252b404dfcc90f7a5d7d5a6f9a7cc'
		auth_token = '6bebfcfc538d46a90595aa9b1024ac29'
		@client = Twilio::REST::Client.new account_sid, auth_token 
		#should send to the actual user make the reservation, send to my own phone instead since trial account
		#@client.account.messages.create(from: '+16018909878',to: phone, body: 'Thanks for reservation!')	
		@client.account.messages.create(from: '+16018909878',to: '+18729043525',body: 'Thanks for reservation!')		
		redirect_to "/users/#{session["user_id"]}", notice: "Thanks for reservation! We have sent you a text confirmation."
    else
      render 'new'
    end    
	
	
	
    
  end

  def destroy
    reservation = Reservation.find_by(id: params["id"])
	user = User.find_by(id:reservation.user_id)
	user.point = user.point-reservation.size
	user.save
    reservation.destroy
    redirect_to "/users/#{session["user_id"]}"
  end


end
