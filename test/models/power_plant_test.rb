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

require 'test_helper'

class PowerPlantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
