# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'Faker'


BRANDS = [
  "A.P.C.","Acne Studios","Reem Acra","Aimé Leon Dore","Akris","Azzedine Alaïa","Reem Alasadi","Alexander McQueen (brand)","Alfred Dunhill Ltd.","Charlie Allen (designer)","Ally Capellino","Alpha Industries","Alter és Kiss","Anderson & Sheppard","André Laug","Andrés Sardá","Andrew Marc","Anna Valentine","Anne Fontaine (brand)","Aquascutum","Armani","Aspinal of London","Asprey","Audience by PETROU\MAN","Dominique Aurientis","H.J. Cave & Sons","Hackett London","Haerfest (fashion brand)","Kevan Hall","Halston","Tim Hamilton (designer)","Hansengross","Hardy Amies (fashion house)","Haus Alkire","Heavy Eco","Daniel Hechter","Helmut Lang (fashion brand)","Alexandre Herchcovitch","Hermès","Carolina Herrera (fashion designer)","Hield","Tommy Hilfiger (company)","Sherri Hill","Georges Hobeika","Hong Kong Tailors","House of Flora","H.Huntsman & Sons", "Agnès b.","Badgley Mischka","Balenciaga","Bally Shoe","Balmain (fashion house)","Neil Barrett (fashion designer)","Belle & Bunty","Bellville Sassoon","Belvest","Benson & Clegg","Berluti","Beulah London","Dirk Bikkembergs","Bill Blass Group","Manolo Blahnik","Ozwald Boateng","BodyMap","Boglioli","Bonia (fashion)","Bontoni","Borsalino","Hugo Boss","Bottega Veneta","Boué Soeurs","Tony Bowls","BP Studio","Veronique Branquinho","Malan Breton","Brioni (brand)","Thom Browne","Brunello Cucinelli (company)","Bulgari","Burberry","Nigel Cabourn","Cacharel","Calibre (Menswear)","Calvin Klein","Camilla and Marc","Caraceni","Pierre Cardin","Jane Carr (fashion designer)","Carrera y Carrera","Cartier (jeweler)","Dean and Dan Caten","Céline (brand)","Cerruti","Cerruti 1881","Hussein Chalayan","Chanel","Charvet Place Vendôme","List of Charvet customers","User:Chefmikesf/BVtest","The Chelsea Cobbler","Childrensalon","Chloé","Christian Dior SE","Matthew Christopher","Chrome Hearts","Clements Ribeiro","Colcci","Comme des Garçons","Common Projects","Jasper Conran","Cornelia James (company)","Corneliani","Costello Tagliapietra","Crolla","CuteCircuit","Cutler and Gross","Cyma Watches","Wendy Dagworthy","DAKS","Damani Dada","Damiani (jewelry company)","DAS Collection","Dege & Skinner","Alessandro Dell'Acqua","Ann Demeulemeester","Dior Homme","DKNY","Dolce & Gabbana","Drake's (haberdashers)","Duvelleroy","E. Thomas","Benoît-Pierre Emery","Enfants Riches Déprimés","Equipment (clothing brand)","Ermanno Scervino","Escada","Etro","Extè","Façonnable","Fendi","Gianfranco Ferré","Fiorucci","Tom Ford","Fossil Group","Franck Sorbier","Frey Wille","Frost French","Holly Fulton","Diane von Fürstenberg","Katie Gallagher","John Galliano","Jean-Paul Gaultier","Gieves & Hawkes","Giusto Manetti Battiloro","Givenchy","Golfino","Ana González (fashion designer)","Gottex","Goyard","Gravati","Great Greenland Furhouse","Gucci","Christopher Kane","Karen Kane","Kate Spade New York","Mary Katrantzou","Rabih Kayrouz","Kenzo (brand)","Khaadi","Kiton","Xander Kostroma","Kristall Smolensk","L.K.Bennett","Lachasse","Lacoste","Christian Lacroix","Karl Lagerfeld","Lagos (jewelry)","Derek Lam","Lancel (company)","Lanvin (company)","Lardini","Guy Laroche","Larusmiani","Judith Leiber","Léo Marciano","Monique Lhuillier","Phillip Lim"
]


CATEGORY = [
  “bags”, “jewellery”, “fine watches”, “belts”, “ties”, “glasses”, “hats”, “pocket squares”, “cufflinks”
]
CONDITION = [
  “perfect”, “very good”, “good”, “worn well”
]



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


user_create(20)




# items
# name category description condition brand price user_id

def item_create(number_of_items)
  number_of_users.times do

    user_params = {
      category: CATEGORY.sample,
      description: Faker::Name.first_name,
      condition: CONDITION.sample
      brand: BRANDS.sample,
      price: "#{Faker::Number.between(200, 2000)}"
      user_id: "123123"
    }
    Item.create(user_params)
  end
end


item_create(200)

# bookings
# start_date end_date item_id user_id

# reviews
# title content user_rating item_rating booking_id



