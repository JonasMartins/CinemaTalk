class CreateStars < ActiveRecord::Migration
  def change
    create_table :stars do |t|
    	t.date :birth_date
    	t.date :death_date
    	t.string :birth_name
    	t.string :nickname
    	t.text :bio
    	t.string :hometown
    	t.string :country
    	# many to many com filmes 
    end
  end
end
