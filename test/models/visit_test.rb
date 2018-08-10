# == Schema Information
#
# Table name: visits
#
#  id               :bigint(8)        not null, primary key
#  visit_date       :date
#  visit_end_time   :time
#  visit_start_time :time
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

require 'test_helper'

class VisitTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
