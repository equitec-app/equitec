# == Schema Information
#
# Table name: accounts
#
#  id          :bigint(8)        not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  customer_id :bigint(8)
#  employee_id :bigint(8)
#
# Indexes
#
#  index_accounts_on_customer_id  (customer_id)
#  index_accounts_on_employee_id  (employee_id)
#
# Foreign Keys
#
#  fk_rails_...  (customer_id => customers.id)
#  fk_rails_...  (employee_id => employees.id)
#

require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
