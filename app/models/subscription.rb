class Subscription < ApplicationRecord
  validates_presence_of :title, :price, :frequency
  belongs_to :tea
end