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

      t.timestamps
    end
  end
end
