# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'
CATEGORIES = %w(chinese italian japanese french belgian)


puts 'Creating restaurants'
50.times do
  restaurant = Restaurant.new(
    name: Faker::Restaurant.name.to_s,
    address: Faker::Address.full_address.to_s,
    phone_number: Faker::PhoneNumber.phone_number_with_country_code.to_s,
    category: CATEGORIES.sample
  )
  restaurant.save!
  puts "#{restaurant.name}"
end

puts 'Creating some reviews for my fake restaurants'
Restaurant.all.each do |restaurant|
  rand(5..10).times do
    restaurant.reviews.create(
      content: Faker::Lorem.sentence(word_count: 3).to_s,
      rating: rand(1..5)
    )
    puts "Created review"
  end
end
