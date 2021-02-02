class Review < ApplicationRecord
  belongs_to :villager
  belongs_to :user
  validates :content, :rating, presence: true
end
