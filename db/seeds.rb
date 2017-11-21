require 'Faker'

Item.delete_all
User.delete_all

BRANDS = [
  "A.P.C.","Acne Studios","Reem Acra","Aimé Leon Dore","Akris","Azzedine Alaïa","Reem Alasadi","Alexander McQueen (brand)","Alfred Dunhill Ltd.","Charlie Allen (designer)","Ally Capellino","Alpha Industries","Alter és Kiss","Anderson & Sheppard","André Laug","Andrés Sardá","Andrew Marc","Anna Valentine","Anne Fontaine (brand)","Aquascutum","Armani","Aspinal of London","Asprey","Audience by PETROU","Dominique Aurientis","H.J. Cave & Sons","Hackett London","Haerfest (fashion brand)","Kevan Hall","Halston","Tim Hamilton (designer)","Hansengross","Hardy Amies (fashion house)","Haus Alkire","Heavy Eco","Daniel Hechter","Helmut Lang (fashion brand)","Alexandre Herchcovitch","Hermès","Carolina Herrera (fashion designer)","Hield","Tommy Hilfiger (company)","Sherri Hill","Georges Hobeika","Hong Kong Tailors","House of Flora","H.Huntsman & Sons", "Agnès b.","Badgley Mischka","Balenciaga","Bally Shoe","Balmain (fashion house)","Neil Barrett (fashion designer)","Belle & Bunty","Bellville Sassoon","Belvest","Benson & Clegg","Berluti","Beulah London","Dirk Bikkembergs","Bill Blass Group","Manolo Blahnik","Ozwald Boateng","BodyMap","Boglioli","Bonia (fashion)","Bontoni","Borsalino","Hugo Boss","Bottega Veneta","Boué Soeurs","Tony Bowls","BP Studio","Veronique Branquinho","Malan Breton","Brioni (brand)","Thom Browne","Brunello Cucinelli (company)","Bulgari","Burberry","Nigel Cabourn","Cacharel","Calibre (Menswear)","Calvin Klein","Camilla and Marc","Caraceni","Pierre Cardin","Jane Carr (fashion designer)","Carrera y Carrera","Cartier (jeweler)","Dean and Dan Caten","Céline (brand)","Cerruti","Cerruti 1881","Hussein Chalayan","Chanel","Charvet Place Vendôme","List of Charvet customers","User:Chefmikesf/BVtest","The Chelsea Cobbler","Childrensalon","Chloé","Christian Dior SE","Matthew Christopher","Chrome Hearts","Clements Ribeiro","Colcci","Comme des Garçons","Common Projects","Jasper Conran","Cornelia James (company)","Corneliani","Costello Tagliapietra","Crolla","CuteCircuit","Cutler and Gross","Cyma Watches","Wendy Dagworthy","DAKS","Damani Dada","Damiani (jewelry company)","DAS Collection","Dege & Skinner","Alessandro Dell'Acqua","Ann Demeulemeester","Dior Homme","DKNY","Dolce & Gabbana","Drake's (haberdashers)","Duvelleroy","E. Thomas","Benoît-Pierre Emery","Enfants Riches Déprimés","Equipment (clothing brand)","Ermanno Scervino","Escada","Etro","Extè","Façonnable","Fendi","Gianfranco Ferré","Fiorucci","Tom Ford","Fossil Group","Franck Sorbier","Frey Wille","Frost French","Holly Fulton","Diane von Fürstenberg","Katie Gallagher","John Galliano","Jean-Paul Gaultier","Gieves & Hawkes","Giusto Manetti Battiloro","Givenchy","Golfino","Ana González (fashion designer)","Gottex","Goyard","Gravati","Great Greenland Furhouse","Gucci","Christopher Kane","Karen Kane","Kate Spade New York","Mary Katrantzou","Rabih Kayrouz","Kenzo (brand)","Khaadi","Kiton","Xander Kostroma","Kristall Smolensk","L.K.Bennett","Lachasse","Lacoste","Christian Lacroix","Karl Lagerfeld","Lagos (jewelry)","Derek Lam","Lancel (company)","Lanvin (company)","Lardini","Guy Laroche","Larusmiani","Judith Leiber","Léo Marciano","Monique Lhuillier","Phillip Lim"
]


CATEGORY = [
  "bags", "jewellery", "fine watches", "belts", "ties", "glasses", "hats", "pocket squares", "cufflinks"
]
CONDITION = [
  "perfect", "very good", "good", "worn well"
]


DESCRIPTIOPN = [
  "an A-line skirt fits closely around the waist and is slightly wider at the bottom","backless adjective","a backless dress does not cover a woman’s back and shoulders","baggy adjective","baggy clothes are very loose on your body","best adjective","used for referring to your nicest or most expensive clothes that you wear on special,occasions",
"boot-cut adjective","boot-cut trousers become slightly wider at the bottom so that they fit easily over,boots",
"brief adjective","not covering much of your body","button-down adjective","a button-down shirt has the ends of the collar fastened to the shirt with buttons","button-through adjective","british a button-through skirt or dress has buttons that go from the top to the,bottom",
"casual adjective","casual clothes are comfortable, and suitable for wearing in informal situations","clingy adjective","informal fitting in a way that shows the shape of your body"
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
      address: "#{Faker::Address.street_address}, #{Faker::Address.city}, #{Faker::Address.country}",
      phone_number: Faker::PhoneNumber.cell_phone,
      password: "123123"
    }
    User.create(user_params)
  end
end


user_create(5)




# items
# name category description condition brand price user_id

def item_create(number_of_items)
  number_of_items.times do

    item_params = {
      name:Faker::StarWars.droid,
      category: CATEGORY.sample,
      description: DESCRIPTIOPN.sample,
      condition: CONDITION.sample,
      brand: BRANDS.sample,
      price: Faker::Number.between(200, 2000),
      user_id: User.all.sample.id
    }
    Item.create(item_params)
  end
end


item_create(4)


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
    "jewellery" => (1..5).to_a,
    "fine watches" => (1..5).to_a,
    "belts" => (1..5).to_a,
    "ties" => (1..5).to_a,
    "glasses" => (1..5).to_a,
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

  item.image = File.open(path, 'r')
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



