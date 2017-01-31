class SetDefaultUserLevel < ActiveRecord::Migration
  def change
  	remove_column :users, :user_level_id
  	add_column :users, :user_level_id, :integer, default: 1
  end
end
