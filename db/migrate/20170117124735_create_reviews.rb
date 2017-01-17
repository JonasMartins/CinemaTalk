class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
    	t.integer :movie_id
    	t.integer :user_id
    	t.string :title
    	t.text :body
    end
  end
end
