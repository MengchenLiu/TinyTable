class StatisticsController < ApplicationController

  def index
 	@is_admin = false
	if session["user_id"].present?
		if User.find_by(id: session["user_id"]).is_admin
			@is_admin = true
		end
	end 
	@user = User.all
	@u_num = User.count
	@r_num = Reservation.count
	

	@chart1 = Gchart.pie(:data => Reservation.group(:size).count.values, :title => "Party size of reservation", 
							:size => "700x200", :labels => Reservation.group(:size).count.keys)
	
	res_id = Reservation.group(:restaurant_id).count.keys
	res_name = Array.new
	res_id.each do |id|
		res_name.push(Restaurant.find_by(id:id).name)	
	end
	@chart2 = Gchart.bar(:data => Reservation.group(:restaurant_id).count.values, :title => "Restaurant Popularity", 
							:size => "700x200", :labels => res_name, :bar_width_and_spacing => '35,55')	
	sum = Review.joins(:review_restaurant).group(:restaurant_id).sum(:score)
	count = Review.joins(:review_restaurant).group(:restaurant_id).count
	avg = Array.new
	name = Array.new
	sum.each do |id,sum|
		avg.push(sum*1.0/count[id])
		name.push(Restaurant.find_by(id:id).name)	
	end

	@chart3 = Gchart.bar(:data => avg, :title => "Restaurant Rating", 
							:size => "700x200", :labels => name, :bar_width_and_spacing => '35,55')		

	@top_users = User.order(:point).reverse_order.first(10)
	
	
	
	
  end
  
end