class Review < ApplicationRecord
  belongs_to :booking

  validates :title, presence: true
  validates :content, presence: true
  validates :user_rating, presence: true, inclusion: { in: [1,2,3,4,5]}
  validates :item_rating, presence: true, inclusion: { in: [1,2,3,4,5]}

end
