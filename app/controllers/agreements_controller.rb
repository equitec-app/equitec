class AgreementsController < ApplicationController
  def new
    @agreement = Agreement.new    
  end
end
