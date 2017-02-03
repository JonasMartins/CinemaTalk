class AddPrpfilePictures < ActiveRecord::Migration
  def change
  	add_column :directors, :profile_picture, :string
  	add_column :screenwriters, :profile_picture, :string
  end
end
