class VisitsController < ApplicationController

  def new
    @visit = Visit.new
    @visit_request = VisitRequest.find(params[:visit_request_id])
    @date_today = monday_of_the_week()
  end

  def create
    @visit = VisitRequest.find(params[:visit_request_id]).create_visit(visit_params)
    if @visit.save
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    @visits = Visit.all.order('created_at DESC')
  end

  private

  def visit_params
    params.require(:visit).permit(:visit_date_time, :visit_end_time, employee_ids: [])
  end
end
