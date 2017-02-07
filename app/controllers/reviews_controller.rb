class ReviewsController < ApplicationController
   
  before_action :set_review, only: [:show, :edit, :update]
  before_action :set_movie # todos usam esse método? 
  
  def index

  	@reviews_amount = @movie.reviews.count
  	#@reviews = @movie.reviews
  end

  def show
  end

  def edit
  end

  def new 
  	@review = Review.new
  end

  def create
  	@review = Review.new(review_params)
    respond_to do |format|
      if @review.save
        format.html { redirect_to movie_path( Movie.find(@review.movie_id ) ) }
        format.json 
        format.js
      else
        format.html { render :new }
        format.json 
        format.js
      end
    end
  end

  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to movie_path( Movie.find(@review.movie_id ) ) }
        format.json 
        format.js
      else
        format.html { render :edit }
        format.json 
        format.js
      end
    end
  end

  private
  	def review_params
    	params.require(:review).permit(:title, :body, :movie_id, :user_id)
    end
  	def set_review
  		@review = Review.find(params[:id])
  	end
  	def set_movie
  		@movie = Movie.find(params[:movie_id])
  	end

end
