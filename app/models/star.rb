require 'json'

class Star < ActiveRecord::Base

has_many :movie_stars
has_many :movies, through: :movie_stars

validates :birth_name, presence: true, length: {minumum: 5, maximum: 100}
validates :birth_date, presence: true
validates :nickname, presence: true, length: {minumum: 4, maximum: 100}
validates :bio, presence: true, length: { within: 20...5000 } 	
validates :country, presence: true
validates :hometown, presence: true

mount_uploader :profile_picture, PictureUploader


end