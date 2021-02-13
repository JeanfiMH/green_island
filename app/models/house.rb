class House < ApplicationRecord
  belongs_to :villager
  has_one_attached :photo
end
