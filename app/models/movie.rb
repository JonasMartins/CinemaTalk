class Movie < ActiveRecord::Base


belongs_to :decade # um filme pertence a uma decada
belongs_to :category # um filme pertence a uma categoria

has_many :movie_genres
has_many :genres, through: :movie_genres


end