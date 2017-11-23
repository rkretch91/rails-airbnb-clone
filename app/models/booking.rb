class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :reviews

  validates :start_date, presence: true
  validates :end_date, presence: true

  before_create :check_date_availability

  def self.check_date_availability(params_booking)
    bookings = Booking.where('start_date < ? OR end_date > ?', self.start_date, self.end_date)
    return bookings.empty?
  end

end
