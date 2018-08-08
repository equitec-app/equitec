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

require 'test_helper'

class VisitRequestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
