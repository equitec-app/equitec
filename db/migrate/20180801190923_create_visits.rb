class CreateVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :visits do |t|
      t.references :headquarter, foreign_key: true
      t.datetime :visit_date_time
      t.time :visit_end_time

      t.timestamps
    end
  end
end
