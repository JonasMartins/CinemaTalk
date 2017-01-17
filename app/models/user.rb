class User < ActiveRecord::Base

belongs_to :user_level

has_many :comments
has_many :reviews

end