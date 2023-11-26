class Tea < ApplicationRecord
  validates_presence_of :title, :description, :tempeature, :brew_time
end