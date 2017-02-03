class Director < ActiveRecord::Base

has_many :movie_directors
has_many :movies, through: :movie_directors

validates :birth_name, presence: true, length: {minumum: 5, maximum: 100}
validates :birth_date, presence: true
validates :nickname, presence: true, length: {minumum: 4, maximum: 100}
validates :bio, presence: true, length: { within: 20...5000 } 	
validates :country, presence: true
validates :hometown, presence: true

mount_uploader :profile_picture, PictureUploader
validate :picture_size


	private
		def picture_size
			if profile_picture.size > 4.megabytes
				errors.add(:profile_picture, "Image must be less than 4MB")
			end
		end

end