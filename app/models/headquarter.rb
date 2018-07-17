# == Schema Information
#
# Table name: headquarters
#
#  id             :bigint(8)        not null, primary key
#  admin          :string
#  admin_celphone :string
#  admin_email    :string
#  admin_phone    :string
#  city           :string
#  code           :string
#  direction      :string
#  ica            :string
#  phone          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  customer_id    :bigint(8)
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

  validates :direction, presence: {message: 'Dirección no puede estar vacío'}
  validates :admin_email, presence: {message: 'Dirección no puede estar vacío'}
  validates :admin_phone, presence: {message: 'Teléfono fijo del administrador no puede estar vacío'}
  validates :admin, presence: {message: 'Nombre del administrador no puede estar vacío'}
  validates :admin_celphone, presence: {message: 'Teléfono celular del administrador no puede estar vacío'}
  validates :city, presence: {message: 'Ciudad no puede estar vacío'}
end
