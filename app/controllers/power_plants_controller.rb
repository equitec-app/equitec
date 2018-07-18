class PowerPlantsController < ApplicationController
  def new
    @customer = Customer.find(params[:customer_id])
    @power_plant =PowerPlant.new()
  end

  def create
    @customer = Customer.find(params[:customer_id])
    @power_plant = @customer.power_plants.create(power_plant_params)
  end

  private

  def power_plant_params
    params.require(:power_plant).permit(:headquarter_id, :capacity, :engine_model, :engine_serial, :engine_trademark, :fuel_tank_capacity, :generator_model, :generator_serial, :generator_trademar, :model, :plate, :serial, :trademark)
  end
end
