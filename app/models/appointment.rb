# == Schema Information
#
# Table name: appointments
#
#  id                       :bigint(8)        not null, primary key
#  maintenanse_voucher_type :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  maintenanse_voucher_id   :integer
#  visit_id                 :bigint(8)
#
# Indexes
#
#  index_appointments_on_visit_id  (visit_id)
#
# Foreign Keys
#
#  fk_rails_...  (visit_id => visits.id) ON DELETE => cascade
#

class Appointment < ApplicationRecord
  belongs_to :visit
  belongs_to :maintenanse_voucher, polymorphic: true
end
