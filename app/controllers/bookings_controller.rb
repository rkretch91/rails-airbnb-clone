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
    if @booking.save
      redirect_to dashboard_path, notice: "Booking confirmed!"
    else
      render :new, notice: "I am sorry, these dates are unavailable."
    end
  end

  def edit
    @item = Item.find(params[:item_id])
    @booking = Booking.find(params[:id])
    @booking.item = @item
  end

  def update
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

