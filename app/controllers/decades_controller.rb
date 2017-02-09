class DecadesController < ApplicationController
  def show
  	@decade = Decade.find(params[:id])
  	@movies = @decade.movies
  end
end
