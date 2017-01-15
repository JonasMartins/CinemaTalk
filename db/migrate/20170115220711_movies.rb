class Movies < ActiveRecord::Migration
  def change
  	create_table :movies do |t|
    	t.string :original_title
    	t.string :aka # also known as: outros títulos para o filme 
    	t.string :IMDB # link para o IMDB
    	t.string :length # duração do filme em minutos 
    	t.string :color # colorido ou preto e branco 
    	t.decimal :sum_users_score, precision: 5, scale: 2 # somando todas as notas dos usuários
    	t.decimal :sum_critics_score, precision: 5, scale: 2 # somando todas as notas dos usuários
    	t.decimal :users_amount_score, precision: 5, scale: 2 # quantidade de notas de usuarios
    	t.decimal :critic_amount_score, precision: 5, scale: 2 # quantidade de notas de criticos
    	# assim para saber as notas de users e criticos basta dividir os relacionados 

    	#TODO director_id 
    	#TODO screenwriters_id -- roteiristas id um filme tem varios roteiristas, ver como fica esta relação
    	#TODO genre_id -- genero do filme
    	# decades_id -- id da década do filme
    	# reviews_id -- criticas sobre o filme, um filme pode ter várias rcriticas
    	# categories_id -- um filme tem apenas uma categoria, um filme pertence a uma categoria, longa, curta, série vtshow
    	# regions_id -- região do filme, um filme tem apenas uma região de origem 

        # mains um nay to many com a tabela stars
    end
  end
end
