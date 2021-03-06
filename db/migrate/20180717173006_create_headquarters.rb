class CreateHeadquarters < ActiveRecord::Migration[5.2]
  def change
    create_table :headquarters do |t|
      t.string :direction
      t.string :phone
      t.string :admin
      t.string :admin_phone
      t.string :admin_email
      t.string :city
      t.string :code
      t.references :customer,foreign_key: { on_delete: :cascade }, index:true

      t.timestamps
    end
  end
end
