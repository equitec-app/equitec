class AgreementsController < ApplicationController
  def new
    @agreement = Agreement.new
  end

  def create
    @agreement = Customer.find(params[:customer_id]).agreements.create(agreement_params)

    if @agreement.save
      redirect_to customer_agreement_path(@agreement.customer.id, @agreement.id)
    else
      render :new
    end
  end

  private

  def agreement_params
    params.require(:agreement).permit(:beginning_date, :end_date, :agreement_type )
  end
end
