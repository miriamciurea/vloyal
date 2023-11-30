# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Cleaning database..."
RewardType.destroy_all
Brand.destroy_all
Card.destroy_all
CardStyle.destroy_all
Location.destroy_all
Category.destroy_all
Reward.destroy_all
User.destroy_all

# Categories

puts "Creating categories..."

coffee_shop = { name: "Coffee Shop" }
hairdresser = { name: "Hairdresser" }
sandwich_shop = { name: "Sandwich Shop" }

[coffee_shop, hairdresser, sandwich_shop].each do |attributes|
  category = Category.create!(attributes)
  puts "Created #{category.name}"
end

# RewardTypes

puts "Creating reward types..."

coffee = { name: "Coffee" }
haircut = { name: "Haircut" }
sandwich = { name: "Sandwich" }

[coffee, haircut, sandwich].each do |attributes|
  reward_type = RewardType.create!(attributes)
  puts "Created #{reward_type.name}"
end

# CardStyles

puts "Creating card styles..."

classic = { theme: "Classic", max_stamps: 8 }
contemporary = { theme: "Contemporary", max_stamps: 8 }
elegant = { theme: "Elegant", max_stamps: 8 }
minimalist = { theme: "Minimalist", max_stamps: 8 }

[classic, contemporary, elegant, minimalist].each do |attributes|
  card_style = CardStyle.create!(attributes)
  puts "Created #{card_style.theme}"
end

# Brands

puts "Creating brands..."

nutmeg_n_koffee = {
  category_id: Category.find_by(name: "Coffee Shop").id,
  reward_type_id: RewardType.find_by(name: "Coffee").id,
  card_style_id: CardStyle.find_by(theme: "Classic").id,
  name: "Nutmeg n' Koffee",
  description: "Nutmeg n' Koffee is a mobile coffee company we sell organic/free trade coffees from around the world. Our products are sold from a 1956 Citroen Hy Van",
  menu: "Flat White: £3",
  website: "https://www.google.com/maps/dir/51.5436735,-0.0910529/nutmeg_n_koffee/@51.5380881,-0.1054934,14z/data=!3m1!4b1!4m9!4m8!1m1!4e1!1m5!1m1!1s0x48761d65bfb9e4e7:0xb39fb1b0dc96353d!2m2!1d-0.075763!2d51.5310155?entry=ttu",
  rating: 5
}
coffee_and_cates = {
  category_id: Category.find_by(name: "Coffee Shop").id,
  reward_type_id: RewardType.find_by(name: "Coffee").id,
  card_style_id: CardStyle.find_by(theme: "Classic").id,
  name: "Coffee & Cates",
  description: "Coffee Shop within a historic Victorian Stables Building. Original features mixed with a vibrant artist look.",
  menu: "Latte: £3",
  website: "https://www.google.com/maps/place/Coffee+%26+Cates/@51.5326409,-0.0794862,17z/data=!3m1!4b1!4m6!3m5!1s0x48761d7735d40a75:0xfe1f5a67002a65d2!8m2!3d51.5326409!4d-0.0769113!16s%2Fg%2F11sgchnwwj?entry=ttu",
  rating: 4
}
fabrique = {
  category_id: Category.find_by(name: "Coffee Shop").id,
  reward_type_id: RewardType.find_by(name: "Coffee").id,
  card_style_id: CardStyle.find_by(theme: "Classic").id,
  name: "Fabrique",
  description: "Our concept is simple, but far from the ordinary: only fresh, natural ingredients and traditional methods are used to make our artisanal sourdough and pastries.",
  menu: "Mocha: £3",
  website: "https://www.google.com/maps/place/Fabrique+Bakery+Hoxton/@51.5317721,-0.0768924,17.01z/data=!4m6!3m5!1s0x48761cbebd55d781:0xf2797818b76e4a10!8m2!3d51.5320634!4d-0.0757079!16s%2Fg%2F124sqdszc?entry=ttu",
  rating: 4.5
}
rise_and_bloom = {
  category_id: Category.find_by(name: "Coffee Shop").id,
  reward_type_id: RewardType.find_by(name: "Coffee").id,
  card_style_id: CardStyle.find_by(theme: "Classic").id,
  name: "Rise & Bloom",
  description: "Modern, minimalist espresso bar specialising in carefully sourced, single origin coffee. Handcrafted breads, pastries and cakes.",
  menu: "Americano: £3",
  website: "https://www.google.com/maps/place/Rise+%26+Bloom/@51.5277068,-0.0811676,17z/data=!3m1!4b1!4m6!3m5!1s0x48761d9c623f8dc7:0x52f654e11e4054f0!8m2!3d51.5277036!4d-0.0762967!16s%2Fg%2F11tjlsgm2f?entry=ttu",
  rating: 3.5
}
legacy_cafe = {
  category_id: Category.find_by(name: "Coffee Shop").id,
  reward_type_id: RewardType.find_by(name: "Coffee").id,
  card_style_id: CardStyle.find_by(theme: "Classic").id,
  name: "Legacy Cafe",
  description: "We offer specialty coffee as well as juices and smoothies made to order from fresh ingredients.",
  menu: "Macchiato: £3",
  website: "https://www.google.com/maps?sca_esv=585953107&output=search&q=legacy+cafe+hoxton&source=lnms&entry=mc&sa=X&ved=2ahUKEwiO_pL2geeCAxVzQ0EAHTHrAOAQ0pQJegQIDBAB",
  rating: 4
}

[nutmeg_n_koffee, coffee_and_cates, fabrique, rise_and_bloom, legacy_cafe].map do |attributes|
  brand = Brand.create!(attributes)
  puts "Created #{brand.name}"
end

# Locations

puts "Creating locations..."

nutmeg_location = { brand_id: Brand.find_by(name: "Nutmeg n' Koffee").id, address: "Hoxton Station, Geffrye St, London E2 8FF", phone_number: "020 8439 1749" }
cates_location = { brand_id: Brand.find_by(name: "Coffee & Cates").id, address: "138 Kingsland Rd, London E2 8DY", phone_number: "020 4783 2398" }
fabrique_location = { brand_id: Brand.find_by(name: "Fabrique").id, address: "385 Geffrye St, London E2 8HZ", phone_number: "020 4839 2308" }
bloom_location = { brand_id: Brand.find_by(name: "Rise & Bloom").id, address: "28 Hackney Rd, London E2 7DZ", phone_number: "020 2439 5498" }
legacy_location = { brand_id: Brand.find_by(name: "Legacy Cafe").id, address: "Cremer St, London E2 8HB", phone_number: "020 4372 3489" }

[nutmeg_location, cates_location, fabrique_location, bloom_location, legacy_location].each do |attributes|
  location = Location.create!(attributes)
  puts "Created #{location.address}"
end

# Users

puts "Creating users..."

daniel = { first_name: "Daniel", last_name: "Shaw", email: "daniel@lewagon.com", password: "123456", business: false }
alejandro = { first_name: "Alejandro", last_name: "Sanz", email: "alejandro@lewagon.com", password: "123456", business: false }
anup = { first_name: "Anup", last_name: "Ale", email: "anup@lewagon.com", password: "123456", business: false }
mark = { first_name: "Mark", last_name: "O'Connor", email: "mark@lewagon.com", password: "123456", business: false }
miriam = { first_name: "Miriam", last_name: "Ciurea", email: "miriam@lewagon.com", password: "123456", business: false }

# Cards & Rewards

nutmeg_card = { brand_id: Brand.find_by(name: "Nutmeg n' Koffee").id, stamps: 0 }
cates_card = { brand_id: Brand.find_by(name: "Coffee & Cates").id, stamps: 0 }
fabrique_card = { brand_id: Brand.find_by(name: "Fabrique").id, stamps: 0 }
bloom_card = { brand_id: Brand.find_by(name: "Rise & Bloom").id, stamps: 0 }
legacy_card = { brand_id: Brand.find_by(name: "Legacy Cafe").id, stamps: 0 }

[daniel, alejandro, anup, mark, miriam].each do |attributes|
  user = User.create!(attributes)
  puts "Created #{user.first_name}"
  puts "Creating cards..."
  [nutmeg_card, cates_card, fabrique_card, bloom_card, legacy_card].each do |card_attributes|
    card = Card.new(card_attributes)
    card.user = user
    card.save!
    puts "Created #{card.id}"
    puts "Creating rewards..."
    reward = Reward.create!(card:)
    puts "Created #{reward.id}"
  end
end

puts "Finished!"
