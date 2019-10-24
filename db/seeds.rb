# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

City.destroy_all
Dog.destroy_all
Dogsitter.destroy_all
Stroll.destroy_all

# on commence par crée 5 villes aléatoirement
5.times do 
    city = City.create(name: Faker::Address.city)
end

# on crée ensuite 40 chiens 
40.times do
    dog = Dog.create(name: Faker::Creature::Dog.name, city_id: rand((City.first.id)..(City.last.id)))
end

# on crée a présent 20 promeneur de chiens 
20.times do
    sitter = Dogsitter.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city_id: rand((City.first.id)..(City.last.id)))
end

# on genere maintenant les promenades 
100.times do
    stroll = Stroll.new(date: Faker::Date.in_date_period, place: Faker::Nation.capital_city, city_id: rand((City.first.id)..(City.last.id)))
end


# ajoute successivement pour chaque promenade 2 chiens de la meme ville
90.times do |id| 
	dogs_strolls = Stroll.find(id+1).dogs << [Dog.where(city_id: Stroll.find(id+1).city_id).sample, Dog.where(city_id: Stroll.find(id+1).city_id).sample]
	id += 1
end

puts " ET VOILA ! :) "