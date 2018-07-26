class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.references :customer, foreign_key: true
      t.references :employee, foreign_key: true

      t.timestamps
    end
  end
end
