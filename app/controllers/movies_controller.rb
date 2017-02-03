class MoviesController < ApplicationController

  before_action :set_movie, only: [:grade, :grade_uniquiness?, :show, :edit, :update]
  helper_method :grade_uniquiness?

  def index
    @mvies = Movie.all
  end

  def show
    
    sum_critic ||= Grade.where(movie_id: @movie.id)
    
    if sum_critic.length == 0    
      @critic_media = '?'
    else
      @critic_media = sum_critic.first.rating
    end
  end

  def edit
    @regions = MoviesHelper::get_regions
    @categories = MoviesHelper::get_categories
    @decades = MoviesHelper::get_decades
  end

  def get_json
    @movies = Movie.all
    render json: @movies
  end

  def new
  	@movie = Movie.new
    @regions = MoviesHelper::get_regions
    @categories = MoviesHelper::get_categories
    @decades = MoviesHelper::get_decades
  end

  def create
    @movie = Movie.new(movie_params)
    respond_to do |format|
      if @movie.save
        format.html { redirect_to movie_path(@movie) }#{ redirect_to @movie, notice: 'movie was successfully created.' }
        format.json #{ render :show, status: :created, location: @movie }
        format.js
      else
        format.html { render :new }
        format.json #{ render json: @movie.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to movie_path(@movie) }#{ redirect_to @movie, notice: 'movie was successfully created.' }
        format.json #{ render :show, status: :created, location: @movie }
        format.js
      else
        format.html { render :edit }
        format.json #{ render json: @movie.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # assegurar que o botão de votar só aparece se o user não tiver votado ainda.
  def grade_uniquiness?
    grade ||= Grade.where("user_id = #{current_user.id} AND movie_id = #{@movie.id}")
    if grade.length > 0 
      return true
    end
  end


  def grade
    @grade = Grade.new
    @grade = Grade.create(rating: params[:rating], user: current_user, movie: @movie) #current user curtiu. 
    respond_to do |format|
      if @grade.valid?
        format.html { }
        format.js
      else
        format.html { }
        format.js
      end
    end
  end  

  def destroy
    @movie.destroy
    respond_to do |format|
      format.html #{ redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json #{ head :no_content }
      format.js
    end
  end

  private
    def movie_params
      params.require(:movie).permit(:original_title, :aka, :IMDB, :length, :synopsis, 
        :color, :decade_id, :category_id, :region_id, :poster, :year, genre_ids: [])
      end
    def set_movie
      @movie = Movie.find(params[:id])
    end
end
