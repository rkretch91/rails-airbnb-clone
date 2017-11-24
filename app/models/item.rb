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
    ["A.P.C.","Acne Studios","Reem Acra","Aimé Leon Dore","Akris","Azzedine Alaïa","Reem Alasadi","Alexander McQueen","Balenciaga", "Gucci", "Saint-Laurent", "Versace, Zegna", "Givenchy", "Off-White", "Suit Supply", "Dior", "Louis Vuitton"]
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
