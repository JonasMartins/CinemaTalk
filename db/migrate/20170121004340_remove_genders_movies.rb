class RemoveGendersMovies < ActiveRecord::Migration
  def change
  	remove_column :movies, :gender_id, :integer
  end
end
