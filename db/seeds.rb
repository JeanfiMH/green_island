# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'

puts "Cleaning database..."

House.destroy_all
Villager.destroy_all
User.destroy_all

puts "Creating users..."

User.create(name: "Tom nook", island_name: "Greenisland", email:"contact@tom_nook.fr", password:"villager")
User.create(name: "Leellou", island_name: "Kokiri", email:"contact@leellou.fr", password:"villager")

puts "Creating villagers..."

url = "https://api.nookipedia.com/villagers?game=nh&nhdetails=true&api_key=c245f893-848a-4727-8f83-0678661bd176"
villagers_serialized = open(url).read
villagers = JSON.parse(villagers_serialized)
villagers = villagers.sample(30)
villagers.each do |villager|
  new_villager = Villager.new(name: villager["name"],
                              gender: villager["gender"],
                              specie: villager["species"],
                              personality: villager["personality"],
                              user: User.all.sample)


  file = URI.open(villager["nh_details"]["image_url"])
  new_villager.photo.attach(io: file, filename: 'house.png', content_type:"image/png" )
  new_villager.save!

  house = House.create!(villager: new_villager)
  # new_villager.house = house

  file_house = URI.open(villager["nh_details"]["house_exterior_url"])
  house.photo.attach(io: file_house, filename: 'house.png', content_type:"image/png" )



  puts villager["name"]
end

puts "Finished!"
