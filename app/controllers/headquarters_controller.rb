class HeadquartersController < ApplicationController
  def new
    @customer = Customer.find(params[:customer_id])
    @headquarter = Headquarter.new    
  end

  def create
    @customer = Customer.find(params[:customer_id])
    @headquarter = @customer.headquarters.create(headquarter_params)
  end

  private

  def headquarter_params
    params.require(:headquarter).permit(:admin, :admin_phone, :admin_celphone, :admin_email, :city, :code, :direction, :ica, :phone)
  end
end
