class ScreenwritersController < ApplicationController
  
  before_action :set_screenwriter, only: [:show, :edit, :update]
  before_action :require_user_critic, only: [:edit, :new, :update]
    
  def index    
    respond_to do |format|
      format.html {   } # se o cliente quiser html, esse bloco é executado
      format.js 
    end
   
  end

  def get_json
    @screenwriters = Screenwriter.all
    render json: @screenwriters # vai salvando todas os objetos criados em formato json pronto para 
    # ser pesquisado pela barra de busca como?
  end

  def show
  end

  def new
    @countries = UsersHelper::get_countries
    @screenwriter = Screenwriter.new    
  end

  def create
    @screenwriter = Screenwriter.new(screenwriter_params)
    if @screenwriter.save
      redirect_to screenwriter_path(@screenwriter)
    else
      @countries = UsersHelper::get_countries      
      render :new
    end
  end

  def edit
  end 

  def update
    if @screenwriter.update(screenwriter_params)
      redirect_to screenwriter_path(@screenwriter)
    else
      @countries = UsersHelper::get_countries
      render :edit
    end
  end
  private

    def screenwriter_params
      params.fetch(:screenwriter).permit(:birth_name, :birth_date, :death_date, :nickname, :bio, 
        :profile_picture, :country, :hometown, :also_director, :also_star, :gender)
    end
    def set_screenwriter
      @screenwriter = Screenwriter.find(params[:id])
      @countries = UsersHelper::get_countries
    end
end
