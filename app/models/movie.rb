class Movie < ActiveRecord::Base


belongs_to :decade # um filme pertence a uma decada
belongs_to :category # um filme pertence a uma categoria

 # nem sempre um filme tem apenas um diretor......
has_many :movie_directors
has_many :diretors, through: :movie_directors

# muitos roteirias
has_many :movie_screenwriters
has_many :screenwriters, through: :movie_screenwriters

has_many :movie_genres
has_many :genres, through: :movie_genres

has_many :movie_stars
has_many :stars, through: :movie_stars

end