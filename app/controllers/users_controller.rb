class UsersController < ApplicationController
  def index
  end

  def new
  	@user = User.new
  	@countries = UsersHelper::get_countries
  end

  def edit
  end

  def show
  end

end
