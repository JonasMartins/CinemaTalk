class ScreenwritersController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def new
  	@screenwriter = Screenwriter.new
  	@countries = UsersHelper::get_countries
  end
end
