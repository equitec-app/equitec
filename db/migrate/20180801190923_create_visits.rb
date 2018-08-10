class CreateVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :visits do |t|
      t.references :headquarter, foreign_key: true
      t.date :visit_date
      t.time :visit_start_time
      t.time :visit_end_time

      t.timestamps
    end
  end
end
