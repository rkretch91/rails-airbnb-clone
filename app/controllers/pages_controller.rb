class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :items]
  def home
    @items = Item.first(3)
    #@shades = Item.find where category is shades
  end
end
