# == Schema Information
#
# Table name: ups
#
#  id                  :bigint(8)        not null, primary key
#  model               :string
#  number_of_batteries :integer
#  power               :float
#  serial              :string
#  trademark           :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  customer_id         :bigint(8)
#  headquarter_id      :bigint(8)
#
# Indexes
#
#  index_ups_on_customer_id     (customer_id)
#  index_ups_on_headquarter_id  (headquarter_id)
#
# Foreign Keys
#
#  fk_rails_...  (customer_id => customers.id)
#  fk_rails_...  (headquarter_id => headquarters.id)
#

class Up < ApplicationRecord
  belongs_to :customer
  belongs_to :headquarter
end
