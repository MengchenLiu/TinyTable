class Review < ApplicationRecord

  belongs_to :review_restaurant,  class_name: 'Restaurant', foreign_key: 'restaurant_id'
  belongs_to :reviewer, class_name: 'User', foreign_key: 'user_id'

  #review score from 0 to 5
  validates :score, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
  #review less than 500 characters
  validates :content, length: { maximum: 500 }
  validates :restaurant_id, uniqueness: { scope: :user_id,
    message: "You have already review this restaurant before, you can change the review by press Edit Review." , on: :create}
	

  
  
end
