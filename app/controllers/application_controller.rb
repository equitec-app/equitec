class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    if resource.is_a?(Employee)
      puts "Es un empleado"
      employee_path(current_employee)
    else
      super
    end
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


end
