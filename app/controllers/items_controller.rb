class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def dashboard
  end

  private
  def item_params
    params.require(:item).permit(:search)
  end
end
