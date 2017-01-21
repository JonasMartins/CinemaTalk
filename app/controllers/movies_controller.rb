class MoviesController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def new
  	@movie = Movie.new
    @regions = MoviesHelper::get_regions
    @categories = MoviesHelper::get_categories
    @decades = MoviesHelper::get_decades
  end
end
