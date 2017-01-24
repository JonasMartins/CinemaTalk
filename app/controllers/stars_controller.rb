class StarsController < ApplicationController
  
  # não vai fazer muita coisa depois
  def index
    # esse stars.all deve ser substituido por um grupo de objetos 
    # que devem estar de acordo com uma certa busca e não todos de uma vez
    @stars = Star.all
    if params[:star_id]
      @star = Star.find(params[:star_id])
    end
  end

  def get_json
    @stars = Star.all
    render json: @stars # vai salvando todas os objetos criados em formato json pronto para 
    # ser pesquisado pela barra de busca como?
  end

  def show
    @star = Star.find(params[:id])
  end

  def new
    #@star = Star.new({:birth_name => 'Default'}) valores default
    @countries = UsersHelper::get_countries
    @star = Star.new    
  end

  def create
    @star = Star.new(star_params)
    if @star.save
      # flash uma especie de notificação
      flash[:success] = "Your Actor was created!"
      redirect_to stars_path(@star)
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
        :profile_picture, :country, :hometown, :also_director, :also_screenwriter, :star_id)
    end
end
