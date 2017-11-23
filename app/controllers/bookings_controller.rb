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
      render :new
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

