class AddGendersMovies < ActiveRecord::Migration
  def change
  	add_column :movies, :gender_id, :integer
  end
end
