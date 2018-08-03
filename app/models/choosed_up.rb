# == Schema Information
#
# Table name: choosed_ups
#
#  id               :bigint(8)        not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  up_id            :bigint(8)
#  visit_request_id :bigint(8)
#
# Indexes
#
#  index_choosed_ups_on_up_id             (up_id)
#  index_choosed_ups_on_visit_request_id  (visit_request_id)
#
# Foreign Keys
#
#  fk_rails_...  (up_id => ups.id)
#  fk_rails_...  (visit_request_id => visit_requests.id)
#

class ChoosedUp < ApplicationRecord
  belongs_to :visit_request
  belongs_to :up
end
