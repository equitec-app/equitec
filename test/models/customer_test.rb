# == Schema Information
#
# Table name: customers
#
#  id                     :bigint(8)        not null, primary key
#  cost_center            :string
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  legal_agent            :string
#  legal_agent_mail       :string
#  legal_agent_phone      :string
#  mainteance_agent       :string
#  mainteance_phone       :string
#  nit                    :string
#  payments_mail          :string
#  payments_manager       :string
#  payments_phone         :string
#  phone                  :string
#  principal_direction    :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  username               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  employee_id            :bigint(8)
#
# Indexes
#
#  index_customers_on_email                 (email) UNIQUE
#  index_customers_on_employee_id           (employee_id)
#  index_customers_on_reset_password_token  (reset_password_token) UNIQUE
#  index_customers_on_username              (username) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (employee_id => employees.id)
#

require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
