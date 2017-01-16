class CreateMovieStars < ActiveRecord::Migration
  def change
    create_table :movie_stars do |t|
    	t.integer :movie_id, :star_id
    end
  end
end
