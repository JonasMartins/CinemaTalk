class AddRegionsMovies < ActiveRecord::Migration
  def change
  	add_column :movies, :region_id, :integer
  end
end
