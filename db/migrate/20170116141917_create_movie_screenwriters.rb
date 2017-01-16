class CreateMovieScreenwriters < ActiveRecord::Migration
  def change
    create_table :movie_screenwriters do |t|
    	t.integer :movie_id, :screenwriter_id
    end
  end
end
