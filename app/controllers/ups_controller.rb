class UpsController < ApplicationController
  def new
    @customer = Customer.find(params[:customer_id])
    @ups =Up.new()
  end

  def create
    @customer = Customer.find(params[:customer_id])
    @ups = @customer.ups.create(ups_params)
  end

  private

  def ups_params
    params.require(:up).permit(:model,:number_of_batteries ,:power,:serial,:trademark ,:type_of_batteries ,:headquarter_id )
  end
end
