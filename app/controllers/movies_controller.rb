class MoviesController < ApplicationController

  helper_method :grade_uniquiness?
  before_action :set_movie, only: [:grade, :grade_uniquiness?, :show, :edit, :update]
  before_action :set_movie_only, only: [:cast, :director, :comfirm_cast, :save_cast]
  before_action :require_user_critic, only: [:cast, :edit, :new, :update]

  $director_array ||= Hash.new
  $star_array ||= Hash.new


  def index
    @mvies = Movie.all
  end

  def show
    
    sum_critic ||= Grade.where("user_level = 2 AND movie_id = #{@movie.id}").sum(:rating)
    sum_public ||= Grade.where("user_level = 1 AND movie_id = #{@movie.id}").sum(:rating)
    
    # @movie.reviews
    
    if sum_critic.to_f == 0    
      @critic_media = '?'
    else
      @count_critic ||= Grade.where("user_level = 2 AND movie_id = #{@movie.id}").count
      @critic_media = sum_critic.to_f/ @count_critic #media
    end

    if sum_public.to_f == 0    
      @public_media = '?'
    else
      @count_public ||= Grade.where("user_level = 1 AND movie_id = #{@movie.id}").count
      @public_media = sum_public.to_f/ @count_public #media
    end

  end

  def edit
    
  end

  def get_json
    @movies = Movie.all
    render json: @movies
  end

  def new
    @regions = MoviesHelper::get_regions
    @categories = MoviesHelper::get_categories
    @decades = MoviesHelper::get_decades
  	@movie = Movie.new
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
    @grade = Grade.create(rating: params[:rating], user: current_user, movie: @movie, user_level: current_user.user_level_id)  
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

  def cast
    respond_to do |format|
      if @movie.valid?
        format.html { }
        format.js
      else
        format.html { }
        format.js
      end
    end
  end

  def director
    respond_to do |format|
      if @movie.valid?
        format.js
      else
        format.js
      end
    end
  end

  def remove_star
    respond_to do |format|
      if params[:remove_star_id]
        format.js
      else
        format.js
      end
    end
  end

  def remove_director
    respond_to do |format|
      if params[:remove_director_id]
        format.js
      else
        format.js
      end
    end
  end

  def save_cast
    respond_to do |format|
      if !$star_array.empty? || !$director_array.empty?
        if !$director_array.empty?
          $director_array.each_key { |director| @movie.directors << director }
          @movie.save
        end
        if !$star_array.empty?
          $star_array.each_key { |star| @movie.stars << star }
          @movie.save
        end
        format.html { redirect_to movie_path(@movie) }
      else
        format.html { 
          @movie.errors.add(:cast, :message => "Cast cant be empty.")
          redirect_to cast_movie_path(@movie)
        }        
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
      @regions = MoviesHelper::get_regions
      @categories = MoviesHelper::get_categories
      @decades = MoviesHelper::get_decades
    end
    def set_movie_only
      @movie = Movie.find(params[:id])
    end
end
