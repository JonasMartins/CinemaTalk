class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
    	t.string :region
    end
  end
end
