class StarSerializer < ActiveModel::Serializer
  attributes :id, :nickname, :country, :also_director, :also_screenwriter, :gender, :created_at, :updated_at
end
