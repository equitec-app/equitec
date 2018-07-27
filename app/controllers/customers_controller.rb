class CustomersController < ApplicationController
  before_action :authorize_admin, only: :new

  def index
    @customers = Customer.all
    @power_plants = PowerPlant.all
    @upss = Up.all
    @logs = []

  end
  def new
    @customer = Customer.new
  end

  def show
    params[:id] ? @customer = Customer.find(params[:id]) : @customer = Customer.find(current_customer.id)
    @headquarter = Headquarter.new
  end

  def create
    @customer = Customer.create(create_customers_params)

    if @customer.save
      puts "COORDINADOR DE CUENTA: #{customer_params[:accounts][:employee_id]}"
      Account.create(customer_id: @customer.id, employee_id: customer_params[:accounts][:employee_id])
      redirect_to employee_path(current_employee)

    else
      puts @customer.errors.full_messages
      render :new
    end
  end

  def update
    @customer = Customer.find(params[:id])

    if @customer.valid_password?(params[:current_password])
      @customer.update(customer_params)
    else
      puts params.has_key?(:current_password)
      @customer.update(customer_params.except(:password, :password_confirmation))
      if params[:current_password].size > 0
        puts "error, contraseña no coincide con la contraseña actual"
        @customer.errors.add(:current_password, "Contraseña actual incorrecta")
      end
    end

    @customer.errors.each do |attribute, message|
      puts attribute
      puts message
    end

    @customer.errors.each do |error|
      puts error
      puts error.class
    end

    puts "Entró al metodo update"
  end

  def import
    @logs = Customer.import(params[:file])
    @customers = Customer.all

    # redirect_to customers_url, notice: 'Products imported.'
  end

  private

  def create_customers_params
    attributes = params.require(:customer).permit(:cost_center, :email, :legal_agent,
       :legal_agent_mail, :legal_agent_phone, :mainteance_agent,
       :mainteance_phone, :nit, :payments_mail, :payments_manager,
       :payments_phone, :phone, :username,
       :principal_direction, :employee_id)
    attributes[:password] = attributes[:nit]
    attributes[:password_confirmation] = attributes[:nit]
    return attributes
  end

  def customer_params
    puts "------------------- CUSTOMER PARAMS------------------------"
    puts params
    params.require(:customer).permit(:cost_center, :email, :legal_agent,
       :legal_agent_mail, :legal_agent_phone, :mainteance_agent,
       :mainteance_phone, :nit, :payments_mail, :payments_manager,
       :payments_phone, :phone, :username, :password, :password_confirmation,
       :principal_direction, accounts: [:employee_id])
  end
end
