class Grade < ActiveRecord::Base
	belongs_to :user
	belongs_to :movie
	
	# validando unicidade para like/dislike de apenas um chef
	validates_uniqueness_of :user, scope: :movie
end