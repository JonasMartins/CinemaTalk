class AddGenderStar < ActiveRecord::Migration
  def change
  	add_column :stars, :gender, :boolean
  end
end
