class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.json :steps
      t.references :batch, foreign_key: true

      t.timestamps
    end
  end
end
