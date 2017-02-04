class Review < ActiveRecord::Base

belongs_to :movie
belongs_to :user

has_many :comments

validates :title, presence: true
validates :user_id, presence: true
validates :movie_id, presence: true
validates :body, presence: true, length: { within: 20...10000 } 	

end