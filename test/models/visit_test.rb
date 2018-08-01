# == Schema Information
#
# Table name: visits
#
#  id             :bigint(8)        not null, primary key
#  visit_day      :date
#  visit_time     :time
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  headquarter_id :bigint(8)
#
# Indexes
#
#  index_visits_on_headquarter_id  (headquarter_id)
#
# Foreign Keys
#
#  fk_rails_...  (headquarter_id => headquarters.id)
#

require 'test_helper'

class VisitTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
