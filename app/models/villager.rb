class Villager < ApplicationRecord
  belongs_to :user
  has_many :reviews dependent: :destroy
  has_many :bookings dependent: :destroy
  validates :name, uniqueness: true, presence: true
  validates :image_villager, uniqueness: true, presence: true
  validates :description_villager, :image_house, :description_house, :specie, :gender, :personality, presence: true
  
end
