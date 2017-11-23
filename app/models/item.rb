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
      where('category LIKE ?', "%#{search}%")
    else
      all
    end
  end

end
