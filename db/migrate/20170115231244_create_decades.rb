class CreateDecades < ActiveRecord::Migration
  def change
    create_table :decades do |t|
    	t.string :decade
    end
  end
end
