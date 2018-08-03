# == Schema Information
#
# Table name: choosed_power_plants
#
#  id               :bigint(8)        not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  power_plant_id   :bigint(8)
#  visit_request_id :bigint(8)
#
# Indexes
#
#  index_choosed_power_plants_on_power_plant_id    (power_plant_id)
#  index_choosed_power_plants_on_visit_request_id  (visit_request_id)
#
# Foreign Keys
#
#  fk_rails_...  (power_plant_id => power_plants.id)
#  fk_rails_...  (visit_request_id => visit_requests.id)
#

class ChoosedPowerPlant < ApplicationRecord
  belongs_to :visit_request
  belongs_to :power_plant
end
