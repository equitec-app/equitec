# == Schema Information
#
# Table name: headquarters
#
#  id          :bigint(8)        not null, primary key
#  admin       :string
#  admin_email :string
#  admin_phone :string
#  city        :string
#  code        :string
#  direction   :string
#  phone       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  customer_id :bigint(8)
#
# Indexes
#
#  index_headquarters_on_customer_id  (customer_id)
#
# Foreign Keys
#
#  fk_rails_...  (customer_id => customers.id)
#

require 'test_helper'

class HeadquarterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
