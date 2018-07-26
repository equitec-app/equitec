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

class Customer < ApplicationRecord
  require 'roo'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_writer :login

  belongs_to :employee

  has_many :agreements, dependent: :delete_all
  has_many :headquarters, dependent: :delete_all
  has_many :power_plants, dependent: :delete_all
  has_many :ups, dependent: :delete_all
  has_one :account


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

  def self.import(file)
    spreadsheet = Roo::Spreadsheet.open(file.path)

    customers_logs = []
    headquarters_logs = []
    power_plants_logs = []
    ups_logs = []

    puts "--------------------- CLIENTES ---------------------"
    header = ['username', 'nit', 'mainteance_agent', 'mainteance_phone', 'email', 'seller', 'account_manager', 'legal_agent', 'legal_agent_mail', 'legal_agent_phone', 'payments_manager', 'payments_phone', 'payments_mail', 'phone', 'principal_direction']

    (2..spreadsheet.sheet('Clientes').last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      puts "----------------------------"
      puts row

      # customer = find_by(username: row["username"]) || new
      customer = Customer.new
      row[:password]=row["nit"]
      row[:password_confirmation]=row["nit"]
      row[:employee_id] = Employee.find_by(email: row['seller']).id
      customer.attributes = row.except(*['account_manager', 'seller'])
      if !customer.save
        errors = []
        customer.errors.each do |attribute, message|
          errors.push(message)
        end
        customers_logs.push({row: i, errors: errors})
      else
        Account.create(employee_id: Employee.find_by(email: row['account_manager']).id, customer_id: customer.id)
      end

    end

    puts "--------------------- SEDES ---------------------"
    header = ['username', 'code', 'city', 'direction', 'phone', 'admin', 'admin_phone', 'admin_email']

    (2..spreadsheet.sheet('Sedes').last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      puts "----------------------------"
      puts row

      if Customer.find_by(username: row["username"])
        # headquarter = Customer.find_by(username: row["username"]).headquarters.find_by(code: row["code"]) || Headquarter.new
        headquarter = Headquarter.new
        row[:customer_id] = Customer.find_by(username: row["username"]).id
        headquarter.attributes = row.except("username")
        if !headquarter.save
          errors = []
          headquarter.errors.each do |attribute, message|
            errors.push(message)
          end
          headquarters_logs.push({row: i, errors: errors})
        end
      end
    end

    puts "--------------------- PLANTAS ---------------------"
    header = ['code', 'plate', 'trademark', 'model', 'capacity', 'serial', 'fuel_tank_capacity', 'engine_trademark', 'engine_model', 'engine_serial', 'generator_trademark', 'generator_model', 'generator_serial']

    (2..spreadsheet.sheet('Plantas').last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      puts "----------------------------"
      puts row

      errors = []
      if Headquarter.find_by(code: row["code"])
        # power_plant = Headquarter.find_by(code: row["code"]).power_plants.find_by(plate: row["plate"]) || PowerPlant.new
        power_plant = PowerPlant.new
        puts power_plant.attributes
        row[:headquarter_id] = Headquarter.find_by(code: row["code"]).id
        row[:customer_id] = Headquarter.find_by(code: row["code"]).customer.id
        power_plant.attributes = row.except("code")

        if !power_plant.save
          power_plant.errors.each do |attribute, message|
            errors.push(message)
          end
          power_plants_logs.push({row: i, errors: errors})
        end
      else
        power_plants_logs.push({row: i, errors: ['Sede no encontrada']})
      end

    end

    puts "--------------------- UPSs ---------------------"
    header = ['code', 'plate', 'trademark', 'model', 'power', 'serial', 'number_of_batteries']

    (2..spreadsheet.sheet('UPSs').last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      puts "----------------------------"
      puts row

      errors = []
      if Headquarter.find_by(code: row["code"])
        # power_plant = Headquarter.find_by(code: row["code"]).power_plants.find_by(plate: row["plate"]) || PowerPlant.new
        ups = Up.new
        puts ups.attributes
        row[:headquarter_id] = Headquarter.find_by(code: row["code"]).id
        row[:customer_id] = Headquarter.find_by(code: row["code"]).customer.id
        ups.attributes = row.except("code")

        if !ups.save
          ups.errors.each do |attribute, message|
            errors.push(message)
          end
          ups_logs.push({row: i, errors: errors})
        end
      else
        ups_logs.push({row: i, errors: ['Sede no encontrada']})
      end

    end
    puts customers_logs
    puts headquarters_logs
    puts power_plants_logs
    puts ups_logs

    return [customers_logs, headquarters_logs, power_plants_logs, ups_logs]

  end

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
