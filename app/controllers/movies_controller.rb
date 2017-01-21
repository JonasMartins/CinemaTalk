class MoviesController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def new
  	@movie = Movie.new
  	@countries = UsersHelper::get_countries
  end
end
