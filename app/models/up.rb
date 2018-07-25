# == Schema Information
#
# Table name: ups
#
#  id                  :bigint(8)        not null, primary key
#  model               :string
#  number_of_batteries :integer
#  plate               :string
#  power               :float
#  serial              :string
#  trademark           :string
#  type_of_batteries   :integer
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

  enum type_of_batteries: [ '5 aperios', ' 12 amperios', '15 amperios']

  validates :headquarter_id, presence: {message: "Sede no puede estar vacío"}
  validates :trademark, presence: {message: "Marca no puede estar vacío"}
  validates :model, presence: {message: "Modelo no puede estar vacío"}
  validates :power, presence: {message: "Potencia no puede estar vacío"}
  validates :plate, presence: {message: "Placa no puede estar vacía"}
  validates :plate, uniqueness: {message: "Placa repetida"}
end
