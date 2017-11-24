class BookingsController < ApplicationController
  def new
    @item = Item.find(params[:item_id])
    @booking = Booking.new
    @booking.user = current_user
  end

  def create
    @item = Item.find(params[:item_id])
    @booking = Booking.new(params_booking)
    @booking.user = current_user
    @booking.item = @item
    if @booking.check_date_availability && @booking.valid_dates
      if @booking.save
        redirect_to dashboard_path, notice: "Booking confirmed!"
      end
    else
      redirect_to item_path(@item), alert: "I am sorry, these dates are unavailable or are not valid."
    end
  end

  def edit
    @item = Item.find(params[:item_id])
    @booking = Booking.find(params[:id])
    @booking.item = @item
  end

  def update
    @item = Item.find(params[:item_id])
    @booking = Booking.find(params[:id])
    @booking.item = @item
    @booking.update(params_booking)
    redirect_to dashboard_path, notice: "Your booking was updated!"
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to dashboard_path
  end

  private
  def params_booking
    params.require(:booking).permit(:start_date, :end_date)
  end

end

