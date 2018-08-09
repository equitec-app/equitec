class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    if resource.is_a?(Employee)
      puts "Es un empleado"
      employee_path(current_employee)
    else
      super
    end
  end

  def monday_of_the_week()
    date = Date.today

    while date.strftime("%A") != 'Monday'
      date = date - 1.day
    end
    return date
  end

  protected

  def devise_parameter_sanitizer
    if resource_class == Customer
      Customer::ParameterSanitizer.new(Customer, :customer, params)
    elsif resource_class == Employee
      Employee::ParameterSanitizer.new(Employee, :employee, params)
    else
      super # Use the default one
    end
  end

  private

  def authorize_admin
    if employee_signed_in?
      return unless !current_employee.admin?
      redirect_to employee_path(current_employee), alert: 'Solo administradores'
    elsif customer_signed_in?
      redirect_to customer_path(current_customer), alert: 'Solo administradores'
    else
      redirect_to new_customer_session_path, alert: 'Solo administradores'
    end
  end


end
