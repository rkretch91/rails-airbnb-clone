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

  def valid_dates
    today = Date.today
    if end_date <= start_date && start_date < today
      false
    else
      true
    end
  end


end



