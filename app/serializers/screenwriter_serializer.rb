class ScreenwriterSerializer < ActiveModel::Serializer
	attributes :id, :nickname, :country, :also_director, :also_star, :created_at, :updated_at
end
