class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :items]
  def home
  end
end
