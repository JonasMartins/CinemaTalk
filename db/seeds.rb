# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Genre.destroy_all

# Meus seeds para a tabela genres sem a possibilidade de acrescentar outro tipo de gereno
Genre.create!([{genre: "Action"},{genre: "Adventure"},{genre: "Animation"},{genre: "Comedy"},
	{genre: "Crime"},{genre: "Drama"},{genre: "Fantasy"},{genre: "Historical"},
	{genre: "Historical Fiction"},{genre: "Horror"},{genre: "Mystery"},{genre: "Philosophical"},
	{genre: "Political"},{genre: "Romance"},{genre: "Saga"},{genre: "Musical"},{genre: "Satira"}
	{genre: "Science Fiction"},{genre: "Thriller"},{genre: "Urban"},{genre: "Western"}])