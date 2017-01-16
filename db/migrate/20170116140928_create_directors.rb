class CreateDirectors < ActiveRecord::Migration
  def change
    create_table :directors do |t|
    	t.date :birth_date
    	t.date :death_date
    	t.string :birth_name
    	t.string :nickname # não precisa ser apelido basta o nome de como ele é conhecido, sem ser o nome completo
    	t.text :bio
    	t.string :hometown
    	t.string :country
    	# many to many com filmes
    end
  end
end
