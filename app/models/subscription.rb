class Subscription < ApplicationRecord
  validates_presence_of :title, :price, :frequency
  belongs_to :tea
  belongs_to :customer
  enum status: {
    "active" => 0,
    "cancelled" => 1
  }
end