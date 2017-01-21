class AddProfilePictureStar < ActiveRecord::Migration
  def change
  	add_column :stars, :profile_picture, :string
  end
end
