class BookingsController < ApplicationController
  def new
    @item = Item.find(params[:item_id])
    @booking = @item.bookings.new
    @booking.user = current_user
  end

  def create
    @item = Item.find(params[:item_id])
    @booking = @item.bookings.new(params_booking)
    @booking.user = @user
    if
    else

    end
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

