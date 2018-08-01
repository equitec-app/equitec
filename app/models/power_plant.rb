# == Schema Information
#
# Table name: power_plants
#
#  id                      :bigint(8)        not null, primary key
#  capacity                :string
#  control_panel_model     :string
#  control_panel_trademark :string
#  engine_model            :string
#  engine_serial           :string
#  engine_trademark        :string
#  fuel_tank_capacity      :float
#  generator_model         :string
#  generator_serial        :string
#  generator_trademark     :string
#  model                   :string
#  plate                   :string
#  serial                  :string
#  trademark               :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  customer_id             :bigint(8)
#  headquarter_id          :bigint(8)
#
# Indexes
#
#  index_power_plants_on_customer_id     (customer_id)
#  index_power_plants_on_headquarter_id  (headquarter_id)
#
# Foreign Keys
#
#  fk_rails_...  (customer_id => customers.id) ON DELETE => cascade
#  fk_rails_...  (headquarter_id => headquarters.id) ON DELETE => cascade
#

class PowerPlant < ApplicationRecord
  belongs_to :customer
  belongs_to :headquarter

  validates :headquarter_id, presence: {message: "Sede no puede estar vacío"}
  validates :trademark, presence: {message: "Marca no puede estar vacío"}
  validates :model, presence: {message: "Modelo no puede estar vacío"}
  validates :capacity, presence: {message: "Potencia no puede estar vacío"}
  validates :plate, presence: {message: "Placa no puede estar vacía"}
  validates :plate, uniqueness: {message: "Placa repetida"}

end
