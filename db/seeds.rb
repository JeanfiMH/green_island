# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# puts "Creating users"

tom = { name: "Tom nook", island_name: "Greenisland", email:"contact@tom_nook.fr", password:"villager" }
leellou = { name: "Leellou", island_name: "Kokiri", email:"contact@leellou.fr", password:"villager" }

[ tom, leellou ].each do |attributes|
  user = User.create!(attributes)
  puts "Created #{user.name}"
end

puts "Creating villagers...."

bob = { name: "Bob", gender: "Male", specie: "Cat", personality: "Lazy" }
poncho = { name: "Poncho", gender: "Male", specie: "Cub", personality: "Jock" }
joey = { name: "Joey", gender: "Male", specie: "Duck", personality: "Lazy" }
diana = { name: "Diana", gender: "Female", specie: "Deer", personality: "Snooty" }
roald = { name: "Roald", gender: "Male", specie: "Penguin", personality: "Jock" }
carmen = { name: "Carmen", gender: "Female", specie: "Rabbit", personality: "Peppy" }
harry = { name: "Harry", gender: "Male", specie: "Hippo", personality: "Cranky" }
pierce = { name: "Pierce", gender: "Male", specie: "Eagle", personality: "Jock" }
tiffany = { name: "Tiffany", gender: "Female", specie: "Cat", personality: "Lazy" }
paolo = { name: "Paolo", gender: "Male", specie: "Elephant", personality: "Lazy" }
maddie = { name: "Maddie", gender: "Female", specie: "Dog", personality: "Peppy" }
moe = { name: "Moe", gender: "Male", specie: "Cat", personality: "Lazy" }
dizzy = { name: "Dizzy", gender: "Male", specie: "Elephant", personality: "Lazy" }
opal = { name: "Opal", gender: "Female", specie: "Elephant", personality: "Snooty" }
molly = { name: "Molly", gender: "Female", specie: "Duck", personality: "Normal" }

[ bob, poncho, joey, diana, roald, carmen, harry, pierce, tiffany, paolo, maddie, moe, dizzy, opal, molly ].each do |attributes|
  villager = Villager.new(attributes)
  villager.user = User.all.sample
  villager.save!
  puts "created #{villager.name}"
end

puts "Finished!"
