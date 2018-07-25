class CreateAgreements < ActiveRecord::Migration[5.2]
  def change
    create_table :agreements do |t|
      t.date :end_date
      t.date :beginning_date
      t.integer :agreement_type
      t.references :customer, foreign_key: { on_delete: :cascade }, index:true

      t.timestamps
    end
  end
end
