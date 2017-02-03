class CreatGrades < ActiveRecord::Migration
  def change
  	create_table :grades do |t|
  		t.integer :movie_id, :user_id
  		t.timestamps
  	end
  end
end
