class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.references :visit, foreign_key: { on_delete: :cascade }, index:true
      t.integer :maintenanse_voucher_id
      t.string :maintenanse_voucher_type

      t.timestamps
    end
  end
end
