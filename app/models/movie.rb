class Movie < ActiveRecord::Base


belongs_to :decade # um filme pertence a uma decada
belongs_to :category # um filme pertence a uma categoria
belongs_to :region 

 # nem sempre um filme tem apenas um diretor......
has_many :movie_directors
has_many :directors, through: :movie_directors

# muitos roteirias
has_many :movie_screenwriters
has_many :screenwriters, through: :movie_screenwriters

has_many :movie_genres
has_many :genres, through: :movie_genres

has_many :movie_stars
has_many :stars, through: :movie_stars

has_many :reviews
has_many :grades

validates :original_title, presence: true
validates :aka, presence: true
validates :IMDB, presence: true
validates :synopsis, presence: true, length: { within: 20...5000 } 	
validates :decade_id, presence: true
validates :category_id, presence: true
validates :region_id, presence: true


mount_uploader :poster, PictureUploader

attr_accessor :cast

=begin

# calculo de likes/dislkes
def thumbs_up_total
	self.likes.where(like: true).size
end

def thumbs_down_total
	self.likes.where(like: false).size
end
=end


end