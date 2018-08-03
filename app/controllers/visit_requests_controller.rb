class VisitRequestsController < ApplicationController

  def new
    @visit_request = Headquarter.find(params[:headquarter_id]).visit_requests.new()
  end

  def show
    # @visitrequest = VisitRequest.find(params[:id])
  end
end
