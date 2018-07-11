class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_writer :login

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: {account_manager: 0, technician: 1, engineer: 2, seller: 3, admin: 4}

  def login
    @login || self.email
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

class Employee::ParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    permit(:sign_up, keys: [:username, :email, :password, :password_confirmation, :remember_me])
    permit(:sign_in, keys: [:username, :email, :password, :password_confirmation, :remember_me])
    permit(:account_update, keys: [:username, :email, :password, :password_confirmation, :remember_me])
  end
end
