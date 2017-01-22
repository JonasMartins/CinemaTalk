class AddTimestampTables < ActiveRecord::Migration
  def change
  	change_table :movies do |t|
    	t.timestamps
    end
    change_table :comments do |t|
    	t.timestamps
    end
    change_table :directors do |t|
    	t.timestamps
    end
    change_table :genres do |t|
    	t.timestamps
    end
    change_table :movie_directors do |t|
    	t.timestamps
    end
    change_table :movie_genres do |t|
    	t.timestamps
    end
    change_table :movie_screenwriters do |t|
    	t.timestamps
    end
    change_table :movie_stars do |t|
    	t.timestamps
    end
    change_table :reviews do |t|
    	t.timestamps
    end
    change_table :screenwriters do |t|
    	t.timestamps
    end
    change_table :stars do |t|
    	t.timestamps
    end
    change_table :users do |t|
    	t.timestamps
    end
  end
end
