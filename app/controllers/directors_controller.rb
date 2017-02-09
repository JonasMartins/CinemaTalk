class DirectorsController < ApplicationController
  before_action :set_director, only: [:show, :edit, :update]
  before_action :require_user_critic, only: [:edit, :new, :update]
    
  def index    
    respond_to do |format|
      format.html {   } # se o cliente quiser html, esse bloco é executado
      format.js 
    end
   
  end

  def get_json
    @directors = Director.all
    render json: @directors # vai salvando todas os objetos criados em formato json pronto para 
    # ser pesquisado pela barra de busca como?
  end

  def show
  end

  def new
    @countries = UsersHelper::get_countries
    @director = Director.new    
  end

  def create
    @director = Director.new(director_params)
    if @director.save
      redirect_to director_path(@director)
    else
      @countries = UsersHelper::get_countries      
      render :new
    end
  end

  def edit
  end 

  def update
    if @director.update(director_params)
      redirect_to director_path(@director)
    else
      @countries = UsersHelper::get_countries
      render :edit
    end
  end
  private

    def director_params
      params.fetch(:director).permit(:birth_name, :birth_date, :death_date, :nickname, :bio, 
        :profile_picture, :country, :hometown, :also_screenwriter, :also_star, :gender)
    end
    def set_director
      @director = Director.find(params[:id])
      @countries = UsersHelper::get_countries
    end
end
