class GradeColumnGrades < ActiveRecord::Migration
  def change
  	add_column :grades, :rating, :decimal, precision: 5, scale: 2
  end
end