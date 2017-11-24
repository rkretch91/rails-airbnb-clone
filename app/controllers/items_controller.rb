class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @items = Item.search(params[:search])
    @query = params[:search]
    @query_message = "You have searched: #{@query}"
    @preselect = {}

    s_params = params.permit("category", "brand", "condition").to_hash

    if s_params.size > 1
    # FILTERS BEGIN
    @items = @items.select{|i| i.brand == s_params["brand"]} unless s_params["brand"].blank?
    @items = @items.select{|i| i.category == s_params["category"]} unless s_params["category"].blank?
    @items = @items.select{|i| i.condition == s_params["condition"]} unless s_params["condition"].blank?

    else
      @search_cat = Item.categories.include?(params[:search]) ? "#{params[:search]}" : ""
      @search_brand = Item.brands.include?(params[:search]) ? "#{params[:search]}" : ""
      @preselect[:category] = @search_cat
      @preselect[:brand] = @search_brand
    end


    if @items.size == 0
      @items = Item.all
      @query_message = "There is no results! Search again..."
    end
    # if request.post?
    #   @items = @items.select{|i| i.category == search_params[:category]}
    # end

  end
# http://localhost:3000/items?params%5B%3Acategory%5D=belts&params%5B%3Abrand%5D=Alexander+McQueen+%28brand%29&params%5B%3Acondition%5D=good

  def show
    @item = Item.find(params[:id])
    @user = User.find(@item.user_id)
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

  def search_params
    params.require(:search).permit(:category, :condition, :brand, :price, :photo )
  end
end

