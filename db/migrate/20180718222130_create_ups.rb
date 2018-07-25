class CreateUps < ActiveRecord::Migration[5.2]
  def change
    create_table :ups do |t|
      t.string :trademark
      t.string :plate
      t.string :model
      t.string :serial
      t.float :power
      t.integer :number_of_batteries
      t.integer :type_of_batteries
      t.references :headquarter, foreign_key: true, index:true
      t.references :customer, foreign_key: true, index:true

      t.timestamps
    end
  end
end
