class StarsController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def new
  	@star = Star.new
  	@countries = UsersHelper::get_countries
  end
end
