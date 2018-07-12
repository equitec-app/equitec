class CreateAgreements < ActiveRecord::Migration[5.2]
  def change
    create_table :agreements do |t|
      t.references :customer, foreign_key: true, index: true
      t.integer :type
      t.date :beginning_date
      t.date :end_date

      t.timestamps
    end
  end
end
