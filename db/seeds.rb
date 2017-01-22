# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Genre.destroy_all

# Meus seeds para a tabela genres sem a possibilidade de acrescentar outro tipo de gereno
# Genre.create!([{genre: "Action"},{genre: "Adventure"},{genre: "Animation"},{genre: "Comedy"},
# 	{genre: "Crime"},{genre: "Drama"},{genre: "Fantasy"},{genre: "Historical"},
# 	{genre: "Historical Fiction"},{genre: "Horror"},{genre: "Mystery"},{genre: "Philosophical"},
# 	{genre: "Political"},{genre: "Romance"},{genre: "Saga"},{genre: "Musical"},{genre: "Satira"}
# 	{genre: "Science Fiction"},{genre: "Thriller"},{genre: "Urban"},{genre: "Western"}])

require 'json'
=begin
# Regions
Region.destroy_all
JSON.parse(open("#{Rails.root}/db/database_json/regions.json").read).each do |region|
	i = Region.new(region)
	i.id = region['id']
	i.save!
end

Category.destroy_all
JSON.parse(open("#{Rails.root}/db/database_json/categories.json").read).each do |category|
	i = Category.new(category)
	i.id = category['id']
	i.save!
end

Decade.destroy_all
JSON.parse(open("#{Rails.root}/db/database_json/decades.json").read).each do |decade|
	i = Decade.new(decade)
	i.id = decade['id']
	i.save!
end

Genre.destroy_all
JSON.parse(open("#{Rails.root}/db/database_json/genres.json").read).each do |genre|
	i = Genre.new(genre)
	i.id = genre['id']
	i.save!
end

UserLevel.destroy_all
JSON.parse(open("#{Rails.root}/db/database_json/user_levels.json").read).each do |user|
	i = UserLevel.new(user)
	i.id = user['id']
	i.save!
end
=end

Star.destroy_all
JSON.parse(open("#{Rails.root}/db/database_json/stars.json").read).each do |star|
	i = Star.new(star)
	i.id = star['id']
	i.save!
end