# == Schema Information
#
# Table name: agreements
#
#  id             :bigint(8)        not null, primary key
#  beginning_date :date
#  end_date       :date
#  type           :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  customer_id    :bigint(8)
#
# Indexes
#
#  index_agreements_on_customer_id  (customer_id)
#
# Foreign Keys
#
#  fk_rails_...  (customer_id => customers.id)
#

class Agreement < ApplicationRecord
  belongs_to :customer
end
