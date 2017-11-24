class Item < ApplicationRecord
  belongs_to :user
  has_attachment :photo

  has_many :bookings, dependent: :destroy
  # has_many :reviews, through: :bookings, dependent: :destroy

  validates :name, presence: true
  validates :category, presence: true, inclusion: { in: ["bags", "jewellery", "fine watches", "belts", "ties", "shades", "hats", "pocket squares", "cufflinks"], allow_nil: false}
  validates :description, presence: true
  validates :condition, presence: true, inclusion: { in: ["perfect", "very good", "good", "worn well"]}
  validates :brand, presence: true
  validates :price, presence: true

  def self.search(search)
    if search
      # unless search.blank?
      # where('category LIKE ?', "%#{search}%")
      Item.where("category LIKE ? OR brand LIKE ?", "%#{search}%","%#{search}%")
    else
      all
    end
  end

  def self.brands
    ["A.P.C.","Acne Studios","Reem Acra","Aimé Leon Dore","Akris","Azzedine Alaïa","Reem Alasadi","Alexander McQueen (brand)","Alfred Dunhill Ltd.","Charlie Allen (designer)","Ally Capellino","Alpha Industries","Alter és Kiss","Anderson & Sheppard","André Laug","Andrés Sardá","Andrew Marc","Anna Valentine","Anne Fontaine (brand)","Aquascutum","Armani","Aspinal of London","Asprey","Audience by PETROU","Dominique Aurientis","H.J. Cave & Sons","Hackett London","Haerfest (fashion brand)","Kevan Hall","Halston","Tim Hamilton (designer)","Hansengross","Hardy Amies (fashion house)","Haus Alkire","Heavy Eco","Daniel Hechter","Helmut Lang (fashion brand)","Alexandre Herchcovitch","Hermès","Carolina Herrera (fashion designer)","Hield","Tommy Hilfiger (company)","Sherri Hill","Georges Hobeika","Hong Kong Tailors","House of Flora","H.Huntsman & Sons", "Agnès b.","Badgley Mischka","Balenciaga","Bally Shoe","Balmain (fashion house)","Neil Barrett (fashion designer)","Belle & Bunty","Bellville Sassoon","Belvest","Benson & Clegg","Berluti","Beulah London","Dirk Bikkembergs","Bill Blass Group","Manolo Blahnik","Ozwald Boateng","BodyMap","Boglioli","Bonia (fashion)","Bontoni","Borsalino","Hugo Boss","Bottega Veneta","Boué Soeurs","Tony Bowls","BP Studio","Veronique Branquinho","Malan Breton","Brioni (brand)","Thom Browne","Brunello Cucinelli (company)","Bulgari","Burberry","Nigel Cabourn","Cacharel","Calibre (Menswear)","Calvin Klein","Camilla and Marc","Caraceni","Pierre Cardin","Jane Carr (fashion designer)","Carrera y Carrera","Cartier (jeweler)","Dean and Dan Caten","Céline (brand)","Cerruti","Cerruti 1881","Hussein Chalayan","Chanel","Charvet Place Vendôme","List of Charvet customers","User:Chefmikesf/BVtest","The Chelsea Cobbler","Childrensalon","Chloé","Christian Dior SE","Matthew Christopher","Chrome Hearts","Clements Ribeiro","Colcci","Comme des Garçons","Common Projects","Jasper Conran","Cornelia James (company)","Corneliani","Costello Tagliapietra","Crolla","CuteCircuit","Cutler and Gross","Cyma Watches","Wendy Dagworthy","DAKS","Damani Dada","Damiani (jewelry company)","DAS Collection","Dege & Skinner","Alessandro Dell'Acqua","Ann Demeulemeester","Dior Homme","DKNY","Dolce & Gabbana","Drake's (haberdashers)","Duvelleroy","E. Thomas","Benoît-Pierre Emery","Enfants Riches Déprimés","Equipment (clothing brand)","Ermanno Scervino","Escada","Etro","Extè","Façonnable","Fendi","Gianfranco Ferré","Fiorucci","Tom Ford","Fossil Group","Franck Sorbier","Frey Wille","Frost French","Holly Fulton","Diane von Fürstenberg","Katie Gallagher","John Galliano","Jean-Paul Gaultier","Gieves & Hawkes","Giusto Manetti Battiloro","Givenchy","Golfino","Ana González (fashion designer)","Gottex","Goyard","Gravati","Great Greenland Furhouse","Gucci","Christopher Kane","Karen Kane","Kate Spade New York","Mary Katrantzou","Rabih Kayrouz","Kenzo (brand)","Khaadi","Kiton","Xander Kostroma","Kristall Smolensk","L.K.Bennett","Lachasse","Lacoste","Christian Lacroix","Karl Lagerfeld","Lagos (jewelry)","Derek Lam","Lancel (company)","Lanvin (company)","Lardini","Guy Laroche","Larusmiani","Judith Leiber","Léo Marciano","Monique Lhuillier","Phillip Lim"]
  end

  def self.categories
    ["bags", "jewellery", "fine watches", "belts", "ties", "shades", "hats", "pocket squares", "cufflinks"]
  end

  def self.conditions
    ["perfect", "very good", "good", "worn well"]
  end

  def next_booked
    today = Date.today
    bookings.select { |b| b.start_date > today }.first
  end

end
