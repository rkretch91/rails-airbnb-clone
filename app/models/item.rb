class Item < ApplicationRecord
  belongs_to :user
  has_attachment :image
end
