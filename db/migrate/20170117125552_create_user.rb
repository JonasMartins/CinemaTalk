class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	# depois entra o digest password
    	t.integer :user_level_id
    	t.date :birth_date
    	t.date :death_date
    	t.string :birth_name
    	t.string :nickname
    	t.text :bio
    	t.string :hometown
    	t.string :country
    end
  end
end
