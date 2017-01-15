class MovieGenres < ActiveRecord::Migration
  def change
  	create_table :movie_genres do |t|
  		t.integer :movie_id, :genre_id
  	end
  end
end
