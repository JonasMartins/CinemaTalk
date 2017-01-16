class AddIndexesMoviesPart1 < ActiveRecord::Migration
  def change
  	# adicionando as primeiras chaves entre movies e decades e categories
  	add_column :movies, :decade_id, :integer
  	add_column :movies, :category_id, :integer
  end
end
