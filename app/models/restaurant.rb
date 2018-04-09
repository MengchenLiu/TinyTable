class Restaurant < ApplicationRecord


  has_many :reservations, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :customers, class_name: "User", through: :reservations
  has_many :reviewers, class_name: "User", through: :reviews
  
  validates :name, presence: true
  validates :table_num, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
  validates :description, length: { maximum: 1000 }


end
