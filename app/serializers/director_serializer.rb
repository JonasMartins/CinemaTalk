class DirectorSerializer < ActiveModel::Serializer
  attributes :id, :nickname, :country, :also_screenwriter, :also_star, :created_at, :updated_at
end
