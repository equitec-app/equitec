class VisitRequestsController < ApplicationController

  def new
    @visit_request = Headquarter.find(params[:headquarter_id]).visit_requests.new()
  end

  def edit
    @visit_request = VisitRequest.find(params[:id])
  end

  def create
    @visit_request = Headquarter.find(params[:headquarter_id]).visit_requests.create(visit_requests_params)
    @visit_requests = VisitRequest.all.order('created_at DESC')
  end

  def show
    @visit_request = VisitRequest.find(params[:id])
  end

  private

  def visit_requests_params
    params.require(:visit_request).permit(:air_filter, :battery, :comment, :concept,
      :coolant, :fuel, :fuel_filter, :mechanical_fail, :money_state, :oil,
      :oil_filter, :requested_money, :supplie_state, :water_filter, :requested_supplies,
       :headquarter_id, power_plant_ids: [], up_ids: [] )
  end
end
