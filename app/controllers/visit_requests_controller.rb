class VisitRequestsController < ApplicationController

  def new
    @visit_request = Headquarter.find(params[:headquarter_id]).visit_requests.new()
  end

  def create
    # @employee = Employee.find(params[:id])
    # @customers = Customer.all
    # @employees = Employee.all
    # @agreements = Agreement.all

    @visit_request = Headquarter.find(params[:headquarter_id]).visit_requests.create(visit_requests_params)

  end

  def show
    # @visitrequest = VisitRequest.find(params[:id])
  end

  private

  def visit_requests_params
    params.require(:visit_request).permit(:air_filter, :battery, :comment, :concept,
      :coolant, :fuel, :fuel_filter, :mechanical_fail, :money_state, :oil,
      :oil_filter, :requested_money, :supplie_state, :water_filter, :headquarter_id )
  end
end
