class DirectorsController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def new
  	@director = Director.new
  	@countries = UsersHelper::get_countries
  end
end
