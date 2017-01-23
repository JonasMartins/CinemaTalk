class StarSerializer < ActiveModel::Serializer
  attributes :id, :nickname, :country, :also_director, :also_screenwriter
end
