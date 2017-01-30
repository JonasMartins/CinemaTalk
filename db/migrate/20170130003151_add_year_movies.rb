class AddYearMovies < ActiveRecord::Migration
  def change
  	add_column :movies, :year, :integer
  end
end
