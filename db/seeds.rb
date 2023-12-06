# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "open-uri"

puts "Cleaning database..."
Category.destroy_all
RewardType.destroy_all
Brand.destroy_all
CardStyle.destroy_all
Card.destroy_all
Reward.destroy_all
Location.destroy_all
User.destroy_all

# Categories

puts "Creating categories..."

coffee_shop = { name: "Coffee Shop", file_name: 'bean.svg' }
hairdresser = { name: "Hairdresser", file_name: 'scissors.svg' }
sandwich_shop = { name: "Sandwich Shop", file_name: 'food.png' }

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

# Brands

puts "Creating brands..."

images = []

# willow_hair = {
#   category_id: Category.find_by(name: "Hairdresser").id,
#   reward_type_id: RewardType.find_by(name: "Haircut").id,
#   name: "Willow Hair",
#   description: "Willow Hair is a hairdressing salon which has been established in the heart of Highgate for 20 years. Revered as a sanctuary for clients to relax and experience quality hairdressing delivered by a team of expert hairdressers providing, cutting and styling, colour services including balayage and highlights plus bond and tape hair extensions.",
#   menu: [
#     {
#       name: "Cut & Blow Dry",
#       price: "£50.0"
#     },
#     {
#       name: "Hair Up Deluxe",
#       price: "£60.0"
#     },
#     {
#       name: "Balayage",
#       price: "£70.0"
#     },
#     {
#       name: "Highlights",
#       price: "£80.0"
#     }
#   ].to_json,
#   website: "https://www.google.com/maps?sca_esv=585953107&output=search&q=willow+hair+highgate&source=lnms&entry=mc&sa=X&ved=2ahUKEwiO_pL2geeCAxVzQ0EAHTHrAOAQ0pQJegQIDBAB",
#   rating: 5
# }
# images << { file: URI.open('https://images.unsplash.com/photo-1605497788044-5a32c7078486?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'), filename: 'willow.jpg' }

# thirty_saloon = {
#   category_id: Category.find_by(name: "Hairdresser").id,
#   reward_type_id: RewardType.find_by(name: "Haircut").id,
#   name: "3thirty Saloon",
#   description:"Welcome to 3thirty Salon, award winning for 'Best Afro Hair Salon London 2015' followed by 'Most Wanted Salon London 2019'. Here we specialise in the fine art of hair styling, cutting, colouring, connoisseurs of curly hair and afro hair specialist using the latest techniques from balayage, ombre, highlights, free hand highlights to all over bleach and speciality treatments on all hair textures, We pride ourselves as one of the UK’s leading afro hairdressers and natural curl specialist, our unique collective of talented stylists allows us to be at the very forefront delivering diverse hairdressing with huge talents to working with all types of hair textures from European, Afro natural hair to Asian.",
#   menu: [
#     {
#       name: "Short Cuts",
#       price: "£50.0"
#     },
#     {
#       name: "Flat Iron Tong",
#       price: "£60.0"
#     },
#     {
#       name: "Curly Perm",
#       price: "£70.0"
#     }
#   ].to_json,
#   website: "https://www.google.com/maps?sca_esv=585953107&output=search&q=3thirty+saloon&source=lnms&entry=mc&sa=X&ved=2ahUKEwiO_pL2geeCAxVzQ0EAHTHrAOAQ0pQJegQIDBAB",
#   rating: 4
# }

# images << { file: URI.open('https://images.unsplash.com/photo-1595476108010-b4d1f102b1b1?q=80&w=1888&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'), filename: '3thirty.jpg' }

nando_sandwich_bar = {
  category_id: Category.find_by(name: "Sandwich Shop").id,
  reward_type_id: RewardType.find_by(name: "Sandwich").id,
  name: "Nando Sandwich Bar",
  description: "Francesco and Giovanni in the context have loaded it up with “Goodies”. Better, “Mammas Goodies.",
  menu: [
    {
      name: "Porchetta",
      price: "£3.0"
    },
    {
      name: " Mediterranean Sandwich",
      price: "£3.5"
    },
    {
      name: "Panini",
      price: "£4.0"
    },
    {
      name: "Authentic Sicilian Cannoli",
      price: "£4.5"
    }
  ].to_json,
  website: "https://www.google.com/maps?sca_esv=585953107&output=search&q=nando+sandwich+bar&source=lnms&entry=mc&sa=X&ved=2ahUKEwiO_pL2geeCAxVzQ0EAHTHrAOAQ0pQJegQIDBAB",
  rating: 4
}
images << { file: URI.open('https://media.istockphoto.com/id/175227656/photo/sandwich-with-prosciutto.jpg?s=612x612&w=0&k=20&c=FKtWD9DJkBiMFRUMtgukYCBIfY8glSFHKCOixr8L5pw='), filename: 'nando.jpg' }

artist_cafe_london = {
  category_id: Category.find_by(name: "Sandwich Shop").id,
  reward_type_id: RewardType.find_by(name: "Sandwich").id,
  name: "Artist Cafe London",
  description: "We are a small independent cafe in the heart of Shoreditch. We serve a range of hot and cold drinks, sandwiches, salads and cakes.",
  menu: [
    {
      name: "Ham & Cheese",
      price: "£3.0"
    },
    {
      name: "Chicken & Avocado",
      price: "£3.5"
    },
    {
      name: "Tuna & Sweetcorn",
      price: "£4.0"
    },
    {
      name: "Egg & Cress",
      price: "£4.5"
    }
  ].to_json,
  website: "https://www.google.com/maps?sca_esv=585953107&output=search&q=artist+cafe+london&source=lnms&entry=mc&sa=X&ved=2ahUKEwiO_pL2geeCAxVzQ0EAHTHrAOAQ0pQJegQIDBAB",
  rating: 4
}

images << { file: URI.open('https://plus.unsplash.com/premium_photo-1661306459481-5d62a5650776?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'), filename: 'artist.jpg' }

nutmeg_n_koffee = {
  category_id: Category.find_by(name: "Coffee Shop").id,
  reward_type_id: RewardType.find_by(name: "Coffee").id,
  name: "Nutmeg n' Koffee",
  description: "Nutmeg n' Koffee is a mobile coffee company we sell organic/free trade coffees from around the world. Our products are sold from a 1956 Citroen Hy Van",
  menu: [
    {
      name: "Flat White",
      price: "£3.0"
    },
    {
      name: "Americano",
      price: "£3.5"
    },
    {
      name: "Cappuccino",
      price: "£4.0"
    },
    {
      name: "Espresso",
      price: "£4.5"
    },
    {
      name: "Latte",
      price: "£5.0"
    },
    {
      name: "Iced Coffee",
      price: "£5.5"
    },
    {
      name: "Affogato",
      price: "£6.0"
    }
  ].to_json,
  website: "https://www.google.com/maps/dir/51.5436735,-0.0910529/nutmeg_n_koffee/@51.5380881,-0.1054934,14z/data=!3m1!4b1!4m9!4m8!1m1!4e1!1m5!1m1!1s0x48761d65bfb9e4e7:0xb39fb1b0dc96353d!2m2!1d-0.075763!2d51.5310155?entry=ttu",
  rating: 5
}

images << { file: URI.open('https://balancecoffee.co.uk/cdn/shop/articles/coffee-shop-london-bridge.jpg?v=1663783874'), filename: 'nutmeg.jpg' }

coffee_and_cates = {
  category_id: Category.find_by(name: "Coffee Shop").id,
  reward_type_id: RewardType.find_by(name: "Coffee").id,
  name: "Coffee & Cates",
  description: "Coffee Shop within a historic Victorian Stables Building. Original features mixed with a vibrant artist look.",
  menu: [
    {
      name: "Flat White",
      price: "£3.0"
    },
    {
      name: "Americano",
      price: "£3.5"
    },
    {
      name: "Cappuccino",
      price: "£4.0"
    },
    {
      name: "Espresso",
      price: "£4.5"
    },
    {
      name: "Latte",
      price: "£5.0"
    },
    {
      name: "Iced Coffee",
      price: "£5.5"
    },
    {
      name: "Affogato",
      price: "£6.0"
    }
  ].to_json,
  website: "https://www.google.com/maps/place/Coffee+%26+Cates/@51.5326409,-0.0794862,17z/data=!3m1!4b1!4m6!3m5!1s0x48761d7735d40a75:0xfe1f5a67002a65d2!8m2!3d51.5326409!4d-0.0769113!16s%2Fg%2F11sgchnwwj?entry=ttu",
  rating: 4
}

images << { file: URI.open('https://www.countryandtownhouse.com/wp-content/uploads/2018/09/nafinia-putra-Kwdp-0pok-I-unsplash-600x400.jpg'), filename: 'cates.jpg' }

fabrique = {
  category_id: Category.find_by(name: "Coffee Shop").id,
  reward_type_id: RewardType.find_by(name: "Coffee").id,
  name: "Fabrique",
  description: "Our concept is simple, but far from the ordinary: only fresh, natural ingredients and traditional methods are used to make our artisanal sourdough and pastries.",
  menu: [
    {
      name: "Flat White",
      price: "£3.0"
    },
    {
      name: "Americano",
      price: "£3.5"
    },
    {
      name: "Cappuccino",
      price: "£4.0"
    },
    {
      name: "Espresso",
      price: "£4.5"
    },
    {
      name: "Latte",
      price: "£5.0"
    },
    {
      name: "Iced Coffee",
      price: "£5.5"
    },
    {
      name: "Affogato",
      price: "£6.0"
    }
  ].to_json,
  website: "https://www.google.com/maps/place/Fabrique+Bakery+Hoxton/@51.5317721,-0.0768924,17.01z/data=!4m6!3m5!1s0x48761cbebd55d781:0xf2797818b76e4a10!8m2!3d51.5320634!4d-0.0757079!16s%2Fg%2F124sqdszc?entry=ttu",
  rating: 4.5
}

images << { file: URI.open('https://www.countryandtownhouse.com/wp-content/uploads/2017/04/find-allpress-cafe.jpg'), filename: 'fabrique.jpg' }

rise_and_bloom = {
  category_id: Category.find_by(name: "Coffee Shop").id,
  reward_type_id: RewardType.find_by(name: "Coffee").id,
  name: "Rise & Bloom",
  description: "Modern, minimalist espresso bar specialising in carefully sourced, single origin coffee. Handcrafted breads, pastries and cakes.",
  menu: [
    {
      name: "Flat White",
      price: "£3.0"
    },
    {
      name: "Americano",
      price: "£3.5"
    },
    {
      name: "Cappuccino",
      price: "£4.0"
    },
    {
      name: "Espresso",
      price: "£4.5"
    },
    {
      name: "Latte",
      price: "£5.0"
    },
    {
      name: "Iced Coffee",
      price: "£5.5"
    },
    {
      name: "Affogato",
      price: "£6.0"
    }
  ].to_json,
  website: "https://www.google.com/maps/place/Rise+%26+Bloom/@51.5277068,-0.0811676,17z/data=!3m1!4b1!4m6!3m5!1s0x48761d9c623f8dc7:0x52f654e11e4054f0!8m2!3d51.5277036!4d-0.0762967!16s%2Fg%2F11tjlsgm2f?entry=ttu",
  rating: 3.5
}

images << { file: URI.open('https://brewround.com/wp-content/uploads/2020/07/independant-coffee-shops.jpg'), filename: 'rise.jpg' }

legacy_cafe = {
  category_id: Category.find_by(name: "Coffee Shop").id,
  reward_type_id: RewardType.find_by(name: "Coffee").id,
  name: "Legacy Cafe",
  description: "We offer specialty coffee as well as juices and smoothies made to order from fresh ingredients.",
  menu: [
    {
      name: "Flat White",
      price: "£3.0"
    },
    {
      name: "Americano",
      price: "£3.5"
    },
    {
      name: "Cappuccino",
      price: "£4.0"
    },
    {
      name: "Espresso",
      price: "£4.5"
    },
    {
      name: "Latte",
      price: "£5.0"
    },
    {
      name: "Iced Coffee",
      price: "£5.5"
    },
    {
      name: "Affogato",
      price: "£6.0"
    }
  ].to_json,
  website: "https://www.google.com/maps?sca_esv=585953107&output=search&q=legacy+cafe+hoxton&source=lnms&entry=mc&sa=X&ved=2ahUKEwiO_pL2geeCAxVzQ0EAHTHrAOAQ0pQJegQIDBAB",
  rating: 4
}

images << { file: URI.open('https://charlieontravel.com/wp-content/uploads/2019/08/Flour-Pot-Bakery-Best-Coffee-Shops-Brighton-570x410.jpg'), filename: 'legacy.jpg' }

card_styles = [{theme: 'Gold' , url: 'https://static.wikia.nocookie.net/disney/images/b/bf/Mickey_Mouse_Disney_1.png/revision/latest/thumbnail/width/360/height/360?cb=20180813011713', local: 'card-themes/gold-card.png'},
{theme: 'Red' , url: 'https://static.wikia.nocookie.net/disney/images/b/bf/Mickey_Mouse_Disney_1.png/revision/latest/thumbnail/width/360/height/360?cb=20180813011713', local: 'card-themes/red-card.png'},
{theme: 'Sky-blue' , url: 'https://static.wikia.nocookie.net/disney/images/b/bf/Mickey_Mouse_Disney_1.png/revision/latest/thumbnail/width/360/height/360?cb=20180813011713', local: 'card-themes/sky-blue-card.png'},
{theme: 'Grass' , url: 'https://static.wikia.nocookie.net/disney/images/b/bf/Mickey_Mouse_Disney_1.png/revision/latest/thumbnail/width/360/height/360?cb=20180813011713', local: 'card-themes/grass-card.png'},
{theme: 'Navy-blue' , url: 'https://static.wikia.nocookie.net/disney/images/b/bf/Mickey_Mouse_Disney_1.png/revision/latest/thumbnail/width/360/height/360?cb=20180813011713', local: 'card-themes/navy-blue-card.png'},
{theme: 'Purple' , url: 'https://static.wikia.nocookie.net/disney/images/b/bf/Mickey_Mouse_Disney_1.png/revision/latest/thumbnail/width/360/height/360?cb=20180813011713', local: 'card-themes/purple-card.png'},
{theme: 'Silver' , url: 'https://static.wikia.nocookie.net/disney/images/b/bf/Mickey_Mouse_Disney_1.png/revision/latest/thumbnail/width/360/height/360?cb=20180813011713', local: 'card-themes/silver-card.png'},
{theme: 'Space-grey' , url: 'https://static.wikia.nocookie.net/disney/images/b/bf/Mickey_Mouse_Disney_1.png/revision/latest/thumbnail/width/360/height/360?cb=20180813011713', local: 'card-themes/space-grey-card.png'},
{theme: 'Coral' , url: 'https://static.wikia.nocookie.net/disney/images/b/bf/Mickey_Mouse_Disney_1.png/revision/latest/thumbnail/width/360/height/360?cb=20180813011713', local: 'card-themes/coral-card.png'}]

[nando_sandwich_bar, artist_cafe_london, nutmeg_n_koffee, coffee_and_cates, fabrique, rise_and_bloom, legacy_cafe].each_with_index do |attributes, index|
  brand = Brand.new(attributes)
  image = images[index]
  brand.photo.attach(io: image[:file], filename: image[:filename], content_type: "image/png")
  brand.save!
  puts "Created #{brand.name}"

  card_style = CardStyle.new({ theme: card_styles[index][:theme], max_stamps: 8, brand_id: brand.id })
  if card_styles[index][:local]
    style_image = File.open(Rails.root.join('app', 'assets', 'images', card_styles[index][:local]))
  else
    style_image = URI.open(card_styles[index][:url])
  end
  card_style.background.attach(io: style_image, filename: "card-style.png", content_type: 'image/png')
  card_style.save
  puts "Created #{card_style}"
end
# Locations

puts "Creating locations..."
# willow_hair = { brand_id: Brand.find_by(name: "Willow Hair").id, address: "1 Highgate High St, Highgate, London N6 5JR", phone_number: "020 8340 1777" }
# thirty_saloon = { brand_id: Brand.find_by(name: "3thirty Saloon").id, address: "330 Old St, London EC1V 9DR", phone_number: "020 9076 7123" }
nando_sandwich_bar = { brand_id: Brand.find_by(name: "Nando Sandwich Bar").id, address: "58 Paul St, London EC2A 4LN", phone_number: "020 5897 2341" }
artist_cafe_london = { brand_id: Brand.find_by(name: "Artist Cafe London").id, address: "1-3 Rivington St, London EC2A 3DT", phone_number: "020 4372 3489" }
nutmeg_location = { brand_id: Brand.find_by(name: "Nutmeg n' Koffee").id, address: "Hoxton Station, Geffrye St, London E2 8FF", phone_number: "020 8439 1749" }
cates_location = { brand_id: Brand.find_by(name: "Coffee & Cates").id, address: "138 Kingsland Rd, London E2 8DY", phone_number: "020 4783 2398" }
fabrique_location = { brand_id: Brand.find_by(name: "Fabrique").id, address: "385 Geffrye St, London E2 8HZ", phone_number: "020 4839 2308" }
bloom_location = { brand_id: Brand.find_by(name: "Rise & Bloom").id, address: "28 Hackney Rd, London E2 7DZ", phone_number: "020 2439 5498" }
legacy_location = { brand_id: Brand.find_by(name: "Legacy Cafe").id, address: "Cremer St, London E2 8HB", phone_number: "020 4372 3489" }

[nando_sandwich_bar, artist_cafe_london, nutmeg_location, cates_location, fabrique_location, bloom_location, legacy_location].each do |attributes|
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
artist_cafe_london_card = { brand_id: Brand.find_by(name: "Artist Cafe London").id, stamps: 7 }
nando_sandwich_bar_card = { brand_id: Brand.find_by(name: "Nando Sandwich Bar").id, stamps: 5 }
nutmeg_card = { brand_id: Brand.find_by(name: "Nutmeg n' Koffee").id, stamps: 7 }
cates_card = { brand_id: Brand.find_by(name: "Coffee & Cates").id, stamps: 5 }
fabrique_card = { brand_id: Brand.find_by(name: "Fabrique").id, stamps: 3 }
bloom_card = { brand_id: Brand.find_by(name: "Rise & Bloom").id, stamps: 1 }
legacy_card = { brand_id: Brand.find_by(name: "Legacy Cafe").id, stamps: 0 }

[daniel, alejandro, anup, mark, miriam].each do |attributes|
  user = User.create!(attributes)
  puts "Created #{user.first_name}"
  puts "Creating cards..."
  [artist_cafe_london_card, nando_sandwich_bar_card, nutmeg_card, cates_card, fabrique_card, bloom_card, legacy_card].each do |card_attributes|
    card = Card.new(card_attributes)
    card.user = user
    card.save!
    puts "Created #{card.id}"
    # puts "Creating rewards..."
    # reward = Reward.create!(card:)
    # puts "Created #{reward.id}"
  end
end

puts "Finished!"
