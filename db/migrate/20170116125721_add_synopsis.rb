class AddSynopsis < ActiveRecord::Migration
  def change
  	add_column :movies, :synopsis, :text
  end
end
