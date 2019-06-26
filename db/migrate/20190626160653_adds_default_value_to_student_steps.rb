class AddsDefaultValueToStudentSteps < ActiveRecord::Migration[5.2]
  def change
    change_column :students, :steps, :json, default: []
  end
end
