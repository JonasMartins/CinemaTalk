class RemoveDeathDateUser < ActiveRecord::Migration
  def change
  	remove_column :users, :death_date
  end
end
