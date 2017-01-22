class StarsController < ApplicationController
  def index
    @stars = Star.all
  end

  def show
    @star = Star.find(params[:id])
    flash[:success] = "Your Actor was created!"
  end

  def new
    #@star = Star.new({:birth_name => 'Default'}) valores default
    @star = Star.new    
    @countries = UsersHelper::get_countries
  end

  def create
    @star = Star.new(star_params)
    if @star.save
      # flash uma especie de notificação
      flash[:success] = "Your Actor was created!"
    else
      @countries = UsersHelper::get_countries
      render :new
    end
  end


  def edit
    @countries = UsersHelper::get_countries
    @star = Star.find(params[:id])
  end 

  def update
     # find the recipe to save
    if @star.update(star_params)
      flash[:success] = "Your Recipe was updated Succesfully!"
      #back to recipe that just have been updated
      redirect_to root_path
    else
      @countries = UsersHelper::get_countries
      render :edit
    end
  end

  private

    def star_params
      params.fetch(:star).permit(:birth_name, :birth_date, :death_date, :nickname, :bio, 
        :profile_picture, :country, :hometown, :also_director, :also_screenwriter)
    end
end
