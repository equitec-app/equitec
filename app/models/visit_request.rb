# == Schema Information
#
# Table name: visit_requests
#
#  id                 :bigint(8)        not null, primary key
#  air_filter         :boolean
#  battery            :boolean
#  comment            :text
#  concept            :integer
#  coolant            :boolean
#  fuel               :boolean
#  fuel_filter        :boolean
#  mechanical_fail    :boolean
#  money_state        :integer
#  oil                :boolean
#  oil_filter         :boolean
#  requested_money    :float
#  requested_supplies :text
#  supplie_state      :integer
#  water_filter       :boolean
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  employee_id        :bigint(8)
#  headquarter_id     :bigint(8)
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
  has_one :visit
  
  before_save :set_money_state
  before_save :set_supplie_state

  belongs_to :headquarter
  belongs_to :employee, optional: true

  has_many :choosed_ups
  has_many :choosed_power_plants
  has_many :power_plants, through: :choosed_power_plants
  has_many :ups, through: :choosed_ups

  enum concept: ['Mantenimiento tipo1', 'Mantenimiento tipo2', 'Mantenimiento correctivo', 'Emergencia']
  enum money_state: ['Dinero pendiente', 'Dinero aprobado', 'Sin solicitud']
  enum supplie_state: ['Insumos pendientes', 'Insumos aprobadoa', 'Sin solicitar']

  private
    def set_money_state
      if self.requested_money.nil?
        self.money_state = 'Sin solicitud'
      else
        self.money_state = 'Dinero pendiente'
      end
    end

    def set_supplie_state
      if self.requested_supplies.size == 0
        self.supplie_state = 'Sin solicitar'
      else
        puts "INSUMOS SOLICITADOS #{self.requested_supplies.size}"
        self.supplie_state = 'Insumos pendientes'
      end
    end

end
