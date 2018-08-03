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

class Headquarter < ApplicationRecord
  belongs_to :customer
  has_many :power_plants, dependent: :delete_all
  has_many :ups, dependent: :delete_all
  has_many :visit_requests, dependent: :delete_all

  validates :direction, presence: {message: 'Dirección no puede estar vacío'}
  validates :phone, presence: {message: 'Teléfono fijo de la sede no puede estar vacío'}
  validates :city, presence: {message: 'Ciudad no puede estar vacío'}
  validates :code, presence: {message: 'Código no puede estar vacío'}
  validates :code, uniqueness: {message: 'Código repetido'}
end
