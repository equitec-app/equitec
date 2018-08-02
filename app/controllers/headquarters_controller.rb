class HeadquartersController < ApplicationController

  def choose_headquarter
    @headquarters = Customer.find(params[:customer_id]).headquarters
  end

  def new
    @customer = Customer.find(params[:customer_id])
    @headquarter = Headquarter.new
  end

  def show
    @headquarter = Headquarter.find(params[:id])
  end

  def create
    @customer = Customer.find(params[:customer_id])
    @headquarter = @customer.headquarters.create(headquarter_params)
  end

  def edit
    @customer = Customer.find(params[:customer_id])
    @headquarter = Headquarter.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:customer_id])
    @headquarter = Headquarter.find(params[:id])

    @headquarter.update(headquarter_params)

    puts "Entró al uptade controller"
  end

  private

  def headquarter_params
    params.require(:headquarter).permit(:admin, :admin_phone, :admin_celphone, :admin_email, :city, :code, :direction, :ica, :phone)
  end
end
