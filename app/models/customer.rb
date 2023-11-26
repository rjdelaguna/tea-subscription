class Customer < ApplicationRecord
  validates_presence_of :first_name, :last_name, :address
  validates :email, uniqueness: :true, presence: :true
  has_many :customer_subscriptions
  has_many :subscriptions, through: :customer_subscriptions
  has_many :teas, through: :subscriptions
end