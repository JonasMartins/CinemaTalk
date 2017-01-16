class CreateScreewriters < ActiveRecord::Migration
  def change
    create_table :screewriters do |t|
    	t.date :birth_date
    	t.date :death_date
    	t.string :birth_name
    	t.string :nickname # não precisa ser apelido basta o nome de como ele é conhecido, sem ser o nome completo
    	t.text :bio
    	t.string :hometown
    	t.string :country
    	# many to many com filmes
    	# na verdade vão ser poucos, pois diretores podem ser roteiristas e provavelmente roteiristas
    end
  end
end
