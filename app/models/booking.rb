class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :reviews

  validates :start_date, presence: true
  validates :end_date, presence: true


  def check_date_availability
    item_bookings = self.item.bookings
    bookings = item_bookings.select{|b| b.start_date <= self.start_date && b.end_date >= self.start_date }
    bookings += item_bookings.select{|b| b.start_date <= self.end_date && b.end_date >= self.end_date }
    return bookings.empty?
  end

end





# bookings = Booking.all.select{|b| b.start_date < c.start_date && b.end_date > c.start_date }
# bookings += Booking.all.select{|b| b.start_date < c.end_date && b.end_date > c.end_date }
# bookings
