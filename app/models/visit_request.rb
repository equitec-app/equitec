# == Schema Information
#
# Table name: visit_requests
#
#  id              :bigint(8)        not null, primary key
#  comment         :text
#  concept         :integer
#  money_state     :integer
#  requested_money :float
#  supplie_state   :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  employee_id     :bigint(8)
#  headquarter_id  :bigint(8)
#
# Indexes
#
#  index_visit_requests_on_employee_id     (employee_id)
#  index_visit_requests_on_headquarter_id  (headquarter_id)
#
# Foreign Keys
#
#  fk_rails_...  (employee_id => employees.id)
#  fk_rails_...  (headquarter_id => headquarters.id)
#

class VisitRequest < ApplicationRecord
  belongs_to :headquarter
  belongs_to :employee

  has_many :choosed_ups
  has_many :choosed_power_plants
  has_many :power_plants, through: :choosed_power_plants
  has_many :ups, through: :choosed_ups

  enum concept: ['Mantenimiento tipo1', 'Mantenimiento tipo2', 'Mantenimiento correctivo', 'Emergencia']
end
