class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
    	t.string :categorie
    end
  end
end
