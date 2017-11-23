class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :items]
  def home
    # @item = Item.first(3)
    @ties = Item.where(category: 'ties').order(created_at: :desc).limit(3)
    @belts = Item.where(category: 'belts').order(created_at: :desc).limit(3)
    @shades = Item.where(category: 'shades').order(created_at: :desc).limit(3)
  end
end
