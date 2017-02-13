class Comment < ActiveRecord::Base

belongs_to :review
belongs_to :user

validates :user_id, presence: true
validates :body, presence: true, length: {minumum: 1, maximum: 300}

end
