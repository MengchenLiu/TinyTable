class User < ApplicationRecord

  has_many :reservations ,dependent: :destroy
  has_many :reviews ,dependent: :destroy
  has_many :reserve_restaurants, class_name: "Restaurant", through: :reservations
  has_many :review_restaurants, class_name: "Restaurant", through: :reviews


  validates :name, presence: true
  validates :password, presence: true
  validates :email, presence: true
  validates :phone_number, presence: true
  #password length from 6 to 20
  validates :password, length: { in: 6..20 }
  #check email format
  validates_format_of :email,:with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/

end
