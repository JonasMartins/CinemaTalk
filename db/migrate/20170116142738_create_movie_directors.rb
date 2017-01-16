class CreateMovieDirectors < ActiveRecord::Migration
  def change
    create_table :movie_directors do |t|
    	t.integer :movie_id, :director_id
    end
  end
end
