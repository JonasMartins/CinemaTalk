class StarsController < ApplicationController

  before_action :set_star, only: [:show, :edit, :update]
  
  def index    
    respond_to do |format|
      format.html {   } # se o cliente quiser html, esse bloco é executado
      format.js 
    end
   
  end

  def get_json
    @stars = Star.all
    render json: @stars # vai salvando todas os objetos criados em formato json pronto para 
    # ser pesquisado pela barra de busca como?
  end

  def show
  end

  def new
    @star = Star.new    
    @countries = UsersHelper::get_countries
  end

  def create
    @star = Star.new(star_params)
    if @star.save
      redirect_to star_path(@star)
    else
      @countries = UsersHelper::get_countries      
      render :new
    end
  end

  def edit
    #@star = Star.find(params[:id])
    @countries = UsersHelper::get_countries
  end 

  def update
    if @star.update(star_params)
      redirect_to star_path(@star)
    else
      @countries = UsersHelper::get_countries
      render :edit
    end
  end
  private

    def star_params
      params.fetch(:star).permit(:birth_name, :birth_date, :death_date, :nickname, :bio, 
        :profile_picture, :country, :hometown, :also_director, :also_screenwriter, :gender, :star_id)
    end
    def set_star
      @star = Star.find(params[:id])
    end
end
