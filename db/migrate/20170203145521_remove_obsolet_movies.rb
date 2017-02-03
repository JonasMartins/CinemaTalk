class RemoveObsoletMovies < ActiveRecord::Migration
  def change
  	remove_column :movies, :sum_users_score
  	remove_column :movies, :sum_critics_score
  	remove_column :movies, :users_amount_score
  	remove_column :movies, :critic_amount_score
  end
end
