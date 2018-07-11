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
    if employee_signed_in?
      return unless !current_employee.admin?
      redirect_to employee_path(current_employee), alert: 'Solo administradores'
    elsif customer_signed_in?
      redirect_to customer_path(current_customer), alert: 'Solo administradores'
    else
      redirect_to new_customer_session_path, alert: 'Solo administradores'
    end
  end

  def employee_params
    params.require(:employee).permit(:username, :email, :role, :password, :password_confirmation)
  end
end
