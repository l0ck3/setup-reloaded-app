class ChangesFirstNameLastNameToFullName < ActiveRecord::Migration[5.2]
  def change
    remove_column :students, :first_name
    rename_column :students, :last_name, :full_name
  end
end
