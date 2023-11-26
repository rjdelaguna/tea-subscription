class Customer < ApplicationRecord
  validates_presence_of :first_name, :last_name, :address
  validates :email, uniqueness: :true, presence: :true
  has_many :subcriptions
end