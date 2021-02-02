class Booking < ApplicationRecord
  belongs_to :villager
  belongs_to :user
end
