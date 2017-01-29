class MoviesController < ApplicationController

  before_action :set_movie, only: [:show, :edit, :update]

  def index
    @mvies = Movie.all
  end

  def show
  end

  def edit
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
        format.html #{ redirect_to @movie, notice: 'movie was successfully created.' }
        format.json #{ render :show, status: :created, location: @movie }
        format.js
      else
        format.html { render :edit }
        format.json #{ render json: @movie.errors, status: :unprocessable_entity }
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
        :color, :decade_id, :category_id, :region_id, :poster, genre_ids: [])
      end
    def set_movie
      @movie = Movie.find(params[:id])
    end

end
