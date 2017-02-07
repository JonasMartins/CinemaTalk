class HomeController < ApplicationController
  def index
  	@movies = Movie.order(updated_at: :desc).first(3) # tres ultimos filmes
  	@reviews = Review.order(updated_at: :desc).first(3) # tres ultimas reviews  
  end
end
