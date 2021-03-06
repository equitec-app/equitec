class CreatePowerPlants < ActiveRecord::Migration[5.2]
  def change
    create_table :power_plants do |t|
      t.string :trademark
      t.string :model
      t.string :capacity
      t.string :serial
      t.string :engine_trademark
      t.string :generator_trademark
      t.string :control_panel_trademark
      t.string :engine_model
      t.string :generator_model
      t.string :control_panel_model
      t.string :engine_serial
      t.string :generator_serial
      t.string :plate
      t.float :fuel_tank_capacity
      t.references :headquarter, foreign_key: { on_delete: :cascade }, index:true
      t.references :customer, foreign_key: { on_delete: :cascade }, index:true


      t.timestamps
    end
  end
end
