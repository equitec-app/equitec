# == Schema Information
#
# Table name: visits
#
#  id               :bigint(8)        not null, primary key
#  visit_day        :date
#  visit_time       :time
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  visit_request_id :bigint(8)
#
# Indexes
#
#  index_visits_on_visit_request_id  (visit_request_id)
#
# Foreign Keys
#
#  fk_rails_...  (visit_request_id => visit_requests.id)
#

class Visit < ApplicationRecord
  belongs_to :visit_request

  has_many :appointments, as: :maintenanse_voucher
  has_many :assignments
  has_many :employees, through: :assignments

end
