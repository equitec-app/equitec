class CustomersController < ApplicationController
  efore_action :authorize_admin, only: :new
  def new
    @customer = Customer.new
  end

  def show

  end

  def create
    puts "INGRESA AL CREATE CUSTOMER"
    @customer = Customer.create(customer_params)

    if @customer.save
      puts "CREO NUEVO EMPLEADO"
      redirect_to employee_path(current_employee)
    else
      puts "PROBLEMA CREANDO NUEVO EMPLEADO"
      puts @customer.errors.full_messages
      render :new
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:agreement, :cost_center, :email, :legal_agent, :legal_agent_mail, :legal_agent_phone, :mainteance_agent, :mainteance_phone, :nit, :payments_mail, :payments_manager, :payments_phone, :phone, :username)
  end
end
