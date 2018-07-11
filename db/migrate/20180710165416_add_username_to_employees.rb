class AddUsernameToEmployees < ActiveRecord::Migration[5.2]
  def change
    add_column :employees, :username, :string
    add_index :employees, :username, unique: true
  end
end
