class Review < ApplicationRecord
  belongs_to :villager
  belongs_to :user
end
