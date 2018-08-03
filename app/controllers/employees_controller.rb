class EmployeesController < ApplicationController
  before_action :authorize_admin, only: :new

  def new
    @employee = Employee.new
  end

  def show
    if params[:id]
      @employee = Employee.find(params[:id])
      @customers = Customer.all
      @employees = Employee.all
      @agreements = Agreement.all
    else
      redirect_to employee_path(current_employee)
    end
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

  def employee_params
    params.require(:employee).permit(:username, :email, :role, :password, :password_confirmation)
  end
end
