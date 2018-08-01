# == Schema Information
#
# Table name: assignments
#
#  id          :bigint(8)        not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  employee_id :bigint(8)
#  visit_id    :bigint(8)
#
# Indexes
#
#  index_assignments_on_employee_id  (employee_id)
#  index_assignments_on_visit_id     (visit_id)
#
# Foreign Keys
#
#  fk_rails_...  (employee_id => employees.id) ON DELETE => cascade
#  fk_rails_...  (visit_id => visits.id) ON DELETE => cascade
#

class Assignment < ApplicationRecord
  belongs_to :visit
  belongs_to :employee
end
