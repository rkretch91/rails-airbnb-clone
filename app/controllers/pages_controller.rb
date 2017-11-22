class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :items]
  def home
    # @item = Item.first(3)
    @ties = Item.find_by(category: :ties)
    @belts = Item.find_by(category: :belts)
    @shades = Item.find_by(category: :shades)
  end
end
