class CreateChoosedPowerPlants < ActiveRecord::Migration[5.2]
  def change
    create_table :choosed_power_plants do |t|
      t.references :visit_request, foreign_key: true
      t.references :power_plant, foreign_key: true

      t.timestamps
    end
  end
end
