Item.delete_all
User.delete_all

BRANDS = [
  "A.P.C.","Acne Studios","Reem Acra","Aimé Leon Dore","Akris","Azzedine Alaïa","Reem Alasadi","Alexander McQueen","Balenciaga", "Gucci", "Saint-Laurent", "Versace, Zegna", "Givenchy", "Off-White", "Suit Supply", "Dior", "Louis Vuitton"
]



CATEGORY = [
  "bags", "jewellery", "fine watches", "belts", "ties", "shades", "hats", "pocket squares", "cufflinks"
]
CONDITION = [
  "perfect", "very good", "good", "worn well"
]


DESCRIPTION = [
"Clearly a man with good taste! Its intricate design makes it look stylish and luxurious. Perfect for any occasion, I personally like to wear it with jeans or a well-fit suit. Let me know if you have any questions on how to pair it, I can help style it for you.",
"Love this piece but only used it once since I have another one I use more regularly. Still in great condition, hate to leave it around and hope you will enjoy it. There aren’t any signs of wear, and is fantastic quality. People’s heads will definitely turn!",
"This is one of my favorite things. Limited edition and super rare, but I decided I should share it with other who appreciate these things. Let me know if you’d like to see the authenticity cards first, I will send photos your way. Slight signs of wear, but nobody will care because of what it is.",
"What event are you thinking of booking this for? It doesn’t matter! This goes well with everything and is super easy to mix and match. If you wear it with casual wear, I suggest spicing up your outfit with another accessory as well. If you wear it with a suit, you’re good to go.",
]




puts 'Creating fake data...'

# user
# email first_name last_name address phone_number password
def user_create(number_of_users)
  number_of_users.times do

    user_params = {
      email: Faker::Internet.free_email,
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      address: Faker::Address.city,
      phone_number: Faker::PhoneNumber.cell_phone,
      password: "123123"
    }
    User.create(user_params)
  end
end


user_create(5)
puts "created users"




# items
# name category description condition brand price user_id

# def item_create(number_of_items)
#   number_of_items.times do

#     item_params = {
#       name:Faker::StarWars.droid,
#       category: CATEGORY.sample,
#       description: DESCRIPTION.sample,
#       condition: CONDITION.sample,
#       brand: BRANDS.sample,
#       price: Faker::Number.between(200, 2000),
#       user_id: User.all.sample.id
#     }
#     Item.create(item_params)
#     puts "created item"

#   end
# end


# item_create(40)

20.times do
  Item.create(
      name:Faker::Hipster.word,
      category: CATEGORY.sample,
      description: DESCRIPTION.sample,
      condition: CONDITION.sample,
      brand: BRANDS.sample,
      price: Faker::Number.between(10, 200),
      user_id: User.all.sample.id
      )
  puts 'created item'
end


def semi_smart_image_for_attachinary(category, item)
  # NOTE: This is example is written for the model "Item" with images
  # saved as "image" via attachinary. If you are calling it something
  # different (ex. "avatar"), then you will need to change the code.
  # Likewise, if your model is different name, you will need to change
  # the model calls in the method. Place this method in "Seeds" file.

  # The method is passed two paramters: 'category' (a string), &
  # 'item' (the object that you will have the image seeded for)

  # -------------------------------------------------------
  # ----------------------START METHOD---------------------
  # -------------------------------------------------------

  db_dir = File.dirname(__FILE__)
  # Gets folder of /db/ in Rails.

  image_ranges = {
    "bags" => (1..6).to_a,
    "jewellery" => (1..4).to_a,
    "fine watches" => (1..5).to_a,
    "belts" => (1..5).to_a,
    "ties" => (1..5).to_a,
    "shades" => (1..5).to_a,
    "hats" => (1..5).to_a,
    "pocket squares" => (1..5).to_a,
    "cufflinks" => (1..5).to_a
  }
  # "category_1", ... IMPORTANT: The categories must be strings. No Symbols.
  # For the ranges for each catgory (i.e. "(1..5).to_a"), change the number "5"
  # to the number of images for that category that you have.

  # Item Range Example: "windsurfing" => (1..3).to_a
  # ((This is for files named: "windsurfing-1.jpg", "windsurfing-2.jpg", etc.))

  # Item Range Example (for User): "female" => (1..7).to_a
  # ((This is an example for using categories for gendered-photos for user avatar))
  random_number_for_category = image_ranges[category].sample
  # This chooses the random number within a range of images (ex: 1, 2, 7, 17, 3)

  path = db_dir + "/images/#{category}-#{random_number_for_category}.jpg"
  # This sets the path to "windsurfing-1.jpg" in /db/images/ directory.

  item.photo = File.open(path, 'r')
  # This uploads the item via attachinary.
  # NOTE: the .image should change based on your migration.

  # ex: if using  "avatar" for User model, then change to "item.avatar"

  item.save
  # Saves item after image upload.
end


Item.all.each do |item|
  semi_smart_image_for_attachinary(item.category, item)
end

# bookings
# start_date end_date item_id user_id

# reviews
# title content user_rating item_rating booking_id



