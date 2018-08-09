class VisitsController < ApplicationController

  def new
    @visit = Visit.new
    @visit_request = VisitRequest.find(params[:visit_request_id])
    @date_today = monday_of_the_week()
  end

  def index
    @visits = Visit.all.order('created_at DESC')
  end
end
