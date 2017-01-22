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

  def create
    @director = director.new(director_params)
    if @director.save
      flash[:success] = "Your Actor was created!"
      redirect_to root_path
    else
      flash[:danger] = "some error"
      render :new
    end
  end


  private
    def director_params
      params.require(:star).permit(:birth_name, :birth_date, :death_date, :nickname, :bio, 
        :profile_picture, :country, :hometown, :also_star, :also_screenwriter)
    end
end
