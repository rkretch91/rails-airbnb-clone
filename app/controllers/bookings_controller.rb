class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @item = Item.find(params[:item_id])
    @user = current_user
  end

  def create
    @booking = Booking.new(params_booking)
    @user = current_user
    @item = Item.find(params[:item_id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def params_booking
    params.require(:booking).permit(:start_date, :end_date)
  end

end

