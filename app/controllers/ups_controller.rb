class UpsController < ApplicationController
  def new
    @customer = Customer.find(params[:customer_id])
    @ups =Up.new()
  end

  def create
    @customer = Customer.find(params[:customer_id])
    @ups = @customer.ups.create(ups_params)
  end

  def edit
    @customer = Customer.find(params[:customer_id])
    @ups = Up.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:customer_id])
    @ups = Up.find(params[:id])

    @ups.update(ups_params)

    puts "Entró al uptade controller"
  end

  private

  def ups_params
    params.require(:up).permit(:model,:number_of_batteries ,:power,:serial,:trademark ,:type_of_batteries ,:headquarter_id )
  end
end
