class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
  if resource.is_a?(Employee)
      puts "Es un empleado"
      employee_path(current_employee)
    else
      super
    end
  end
end
