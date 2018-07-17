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
#
# Indexes
#
#  index_customers_on_email                 (email) UNIQUE
#  index_customers_on_reset_password_token  (reset_password_token) UNIQUE
#  index_customers_on_username              (username) UNIQUE
#

class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_writer :login

  has_many :agreements, dependent: :delete_all

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         authentication_keys: [:login]

  enum agreement: {'Tipo 1'=>1, 'Tipo 2'=>2, 'Sin contrato'=>3}
  validates :mainteance_agent, presence: {message: "Encargado de mantenimiento no puede estar vacío" }
  validates :mainteance_phone, presence: {message: "Teléfono del encargado de mantenimiento no puede estar vacío" }
  validates :email, presence: {message: "Correo del encargado de mantenimiento no puede estar vacío" }
  validates :username, presence: {message: "Nombre de empresa no puede estar vacío" }
  validates :username, uniqueness: {message: "Nombre de empresa no válido" }
  validates :nit, presence: {message: "Nit no puede estar vacío" }
  validates :principal_direction, presence: {message: "Dirección principal no puede estar vacío" }
  validates :phone, presence: {message: "Teléfono principal no puede estar vacío" }

  def login
    @login || self.username || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
     where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
     where(conditions.to_h).first
    end
  end
end

class Customer::ParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    permit(:sign_up, keys: [])
    permit(:sign_in, keys: [:username, :email, :password, :password_confirmation, :remember_me])
    permit(:account_update, keys: [])
  end
end
