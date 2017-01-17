class AddPolimorfismCast < ActiveRecord::Migration
  def change
  	drop_table :screewnriters

  	add_column :stars, :also_director, :boolean, default: false
  	add_column :stars, :also_screenwriter, :boolean, default: false
  	add_column :directors, :also_star, :boolean, default: false
  	add_column :directors, :also_screenwriter, :boolean, default: false
  	add_column :screenwriters, :also_director, :boolean, default: false
  	add_column :screenwriters, :also_star, :boolean, default: false

  end
end
