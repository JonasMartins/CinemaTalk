class ChangeBooleanColor < ActiveRecord::Migration
  def change
  	remove_column :movies, :color
  	add_column :movies, :color, :boolean, default: true
  end
end
