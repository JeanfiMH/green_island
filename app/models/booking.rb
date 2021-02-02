class Booking < ApplicationRecord
  belongs_to :villager
  belongs_to :user
  validates :villager, :user, presence: true
end
