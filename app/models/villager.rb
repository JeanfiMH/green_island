class Villager < ApplicationRecord

  GENDERS = ["Male", "Female"]
  validates :gender, inclusion: { in: GENDERS}

  SPECIES = ["Alligator", "Anteater", "Bear", "Bird", "Bull", "Cat", "Cub", "Chicken", "Cow", "Deer", "Dog", "Duck", "Eagle", "Elephant", "Frog", "Goat", "Gorilla", "Hamster", "Hippo", "Horse", "Koala", "Kangaroo", "Lion", "Monkey", "Mouse", "Octopus", "Ostrich", "Penguin", "Pig", "Rabbit", "Rhino", "Sheep", "Squirrel", "Tiger", "Wolf"]
  validates :specie, inclusion: { in: SPECIES}

  PERSONALITIES = ["Lazy", "Jock", "Cranky", "Smug", "Normal", "Peppy", "Snooty", "Sisterly"]
  validates :personality, inclusion: { in: PERSONALITIES}

  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  validates :name, uniqueness: true, presence: true
  # validates :image_villager, presence: true
  validates :specie, presence: true
  validates :gender, presence: true
  validates :personality, presence: true
  # validates :image_house, presence: true
  # validates :description_villager, presence: true
  # validates :description_house, presence: true

end
