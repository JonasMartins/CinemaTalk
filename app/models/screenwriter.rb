class Screenwriter < ActiveRecord::Base

has_many :movie_screenwriters
has_many :movies, through: :movie_screenwriters


end