class HomeController < ApplicationController
  def index
  	@movies = Movie.order(:updated_at).first(3)
  end
end
