class Reservation < ApplicationRecord

  belongs_to :reserve_restaurant,  class_name: 'Restaurant', foreign_key: 'restaurant_id'
  belongs_to :customer, class_name: 'User', foreign_key: 'user_id'

  
  validates :restaurant_id, presence: true
  validates :user_id, presence: true
  validates :time, presence: true
  
  #validate :time_upcoming
  validate :time_in_hour
  validate :if_full

  #reservations time must be a future time
  def time_upcoming
    i = true
	begin
		time.to_time
	rescue
		i=false
	end
	if i
		if time < Time.now.utc
		  errors.add(:time, 'must be a future time') 
		end
	end
  end 
 
  #reservations time is between 11:00 am to 10:00 pm
  def time_in_hour
    i = true
	begin
		time.to_time
	rescue
		i=false
		errors.add(:time, 'time format wrong, should like 2017-6-15 11:00:00')
	end    
	if i
		h = time.hour
		if h<11||h>22
			errors.add(:time, 'time must between 11:00 am to 10:00 pm')
		end		
	end
  end

  #reservations time is between 11:00 am to 10:00 pm
  def if_full
    i = true
	begin
		time.to_time
	rescue
		i=false
	end    
	if i
		cur = Reservation.where(restaurant_id:restaurant_id,time:time.to_time).count
		if cur >= Restaurant.find_by(id:restaurant_id).table_num
			errors.add(:time, 'All table in this time slot are booked, please try other time')
		end		
	end

  end
  
  

end
