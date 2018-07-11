class EmployeesController < ApplicationController
  before_action :authorize_admin, only: :new

  def new
    @employee = Employee.new
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def create
    puts "INGRESA AL CREATE EMPLOYEE"
    @employee = Employee.create(employee_params)

    if @employee.save
      puts "CREO NUEVO EMPLEADO"
      redirect_to employee_path(current_employee)
    else
      puts "PROBLEMA CREANDO NUEVO EMPLEADO"
      puts @employee.errors.full_messages
      render :new
    end
  end

  private

  def authorize_admin
    return unless !current_employee.admin?
    puts "Validacion de administrador"
    puts root_path
    redirect_to new_customer_session_path, alert: 'Solo administradores'
  end

  def employee_params
    params.require(:employee).permit(:username, :email, :role, :password, :password_confirmation)
  end
end
