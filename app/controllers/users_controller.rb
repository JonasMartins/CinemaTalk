class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_same_user, only: [:edit, :update]
  before_action :require_user_admin, only: [:destroy]
  
  def index
  end

  def new           
  	@user = User.new
    @countries = UsersHelper::get_countries
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      @countries = UsersHelper::get_countries
      render :new
    end
  end

  def edit
    @countries = UsersHelper::get_countries
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      @countries = UsersHelper::get_countries
      render :new
    end
  end
  
  def show
  end

   def destroy
    @user.destroy
    respond_to do |format|
      format.html {  }
      format.js
    end
  end

  private

    def user_params
      params.fetch(:user).permit(:user_level,:birth_name, :birth_date,:nickname, :bio, 
        :country, :hometown, :email, :password)
    end
    def set_user
      @user = User.find(params[:id])
    end

    def get_user
      if @user
        return @user
      end
    end
    
    def require_same_user
      if logged_in?
        if (current_user != get_user)
          redirect_to root_path
        end
      else
        redirect_to root_path
      end
    end

end
