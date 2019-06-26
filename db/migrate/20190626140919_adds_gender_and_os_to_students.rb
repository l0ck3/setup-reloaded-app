class AddsGenderAndOsToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :gender, :string
    add_column :students, :os, :string
  end
end
