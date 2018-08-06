class CreateVisitRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :visit_requests do |t|
      t.references :headquarter, foreign_key: true
      t.references :employee, foreign_key: true
      t.integer :money_state
      t.integer :supplie_state
      t.float :requested_money
      t.integer :concept
      t.text :comment
      t.boolean :oil_filter
      t.boolean :oil
      t.boolean :air_filter
      t.boolean :water_filter
      t.boolean :coolant
      t.boolean :battery
      t.boolean :fuel
      t.boolean :mechanical_fail

      t.timestamps
    end
  end
end
