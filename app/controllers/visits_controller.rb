class VisitsController < ApplicationController
  def index
    @visits = Visit.all.order('created_at DESC')
  end
end
