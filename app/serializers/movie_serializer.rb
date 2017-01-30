class MovieSerializer < ActiveModel::Serializer
  attributes :id, :original_title, :aka, :IMDB, :length, :color, :decade_id, :category_id, :region_id, :created_at, :updated_at 
end
