class StarsController < ApplicationController
  def index
  end

  def show
    @star = Star.find(params[:id])
  end

  def edit
  end

  def new
  	@star = Star.new
  	@countries = UsersHelper::get_countries
  end

  def create
    @star = Recipe.new(star_params)
    if @star.save
      # flash uma especie de notificação
      flash[:success] = "Your Actor was created!"
      
      redirect_to stars_path(@star)
    else
      render :new
    end
  end


  private
    def star_params
      params.required(:star).permit(:birth_name, :birth_date, :death_date, :nickname, :bio, 
        :profile_picture, :country, :hometown, :also_director, :also_screenwriter)
    end
end
