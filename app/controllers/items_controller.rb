class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    # if params[:search]
    #   @items = Item.find(params[:search])
    # else
      @items = Item.all
    # end
  end

  def show
    @item = Item.find(params[:id])
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
      redirect_to dashboard_path(current_user), notice: "Item added to system!"
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
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
    params.require(:item).permit(:name, :category, :description, :condition, :brand, :price, :user_id)

  end
end

