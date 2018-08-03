class CreateChoosedUps < ActiveRecord::Migration[5.2]
  def change
    create_table :choosed_ups do |t|
      t.references :visit_request, foreign_key: true
      t.references :up, foreign_key: true

      t.timestamps
    end
  end
end
