class Villager < ApplicationRecord
  GENDERS = ["Male", "Female"]
  validates :gender, inclusion: { in: GENDERS}

  SPECIES = ["Cat", "Cub","Duck", "Deer", "Penguin", "Rabbit", "Hippo", "Eagle", "Elephant", "Dog"]
  validates :specie, inclusion: { in: SPECIES}

  PERSONALITIES = ["Lazy", "Jock","Snooty", "Peppy", "Cranky"]
  validates :personality, inclusion: { in: PERSONALITIES}

  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy
  validates :name, uniqueness: true, presence: true
  #validates :image_villager, uniqueness: true, presence: true
  validates :specie, :gender, :personality, presence: true
  #validates :description_villager, :image_house, :description_house, presence: true

end
