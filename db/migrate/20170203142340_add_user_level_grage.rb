class AddUserLevelGrage < ActiveRecord::Migration
  def change
  	add_column :grades, :user_level, :integer
  end
end
