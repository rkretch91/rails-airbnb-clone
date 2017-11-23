class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @items = Item.search(params[:search])
    @query = params[:search]
  end


  def show
    @item = Item.find(params[:id])
    @user = User.find(@item.user_id)
    @booking = Booking.new
    # @user_coordinates = { latitude: @user.latitude, longitude: @user.longitude }
    @hash = Gmaps4rails.build_markers(@user) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
  end

  def new
    @item = Item.new
    @user = current_user
  end

  def create
    @item = Item.new(params_item)
    @user = current_user
    @item.user = @user
    if @item.save
      redirect_to root_path, notice: "Item added to system!"
    else
      render :new
    end
  end
  def edit
    @item = Item.find(params[:id])
    unless @item.user == current_user
      redirect_to dashboard_path, notice: "This isn't your item"
    end
  end

  def update
    @item = Item.find(params[:id])
    @item.update(params_item)
    redirect_to dashboard_path
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to dashboard_path
  end

  def dashboard
  end

  private

  def params_item
    params.require(:item).permit(:name, :category, :description, :condition, :brand, :price, :user_id, :photo, :search)

  end
end

