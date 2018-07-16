class CustomersController < ApplicationController
  before_action :authorize_admin, only: :new

  def index
    @customers = Customer.all
  end
  def new
    @customer = Customer.new
  end

  def show
    params[:id] ? @customer = Customer.find(params[:id]) : @customer = Customer.find(current_customer.id)
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

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)

    puts "Entró al metodo update"
  end

  private

  def customer_params
    params.require(:customer).permit(:cost_center, :email, :legal_agent, :legal_agent_mail, :legal_agent_phone, :mainteance_agent, :mainteance_phone, :nit, :payments_mail, :payments_manager, :payments_phone, :phone, :username, :password, :password_confirmation)
  end
end
