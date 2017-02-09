class RegionsController < ApplicationController
  def show
  	@region = Region.find(params[:id])
  	@movies = @region.movies
  end
end
