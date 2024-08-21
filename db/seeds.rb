# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# 1. Clean the DB
# Populate the DB

puts "Cleaning database..."
Restaurant.destroy_all

puts "Creating restaurants..."
dishoom = { name: "Dishoom", address: "7 Boundary St, London E2 7JE", rating: 5, chef_name: 'Carla' }
pizza_east =  { name: "Pizza East", address: "56A Shoreditch High St, London E1 6PQ", rating: 4, chef_name: "Chloe" }

[dishoom, pizza_east].each do |attributes|
  restaurant = Restaurant.create!(attributes)
  # ! will raise the errors
  #  .new + .save
  puts "Created #{restaurant.name}"
end
puts "Finished!"
