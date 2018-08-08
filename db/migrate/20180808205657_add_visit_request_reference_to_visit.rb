class AddVisitRequestReferenceToVisit < ActiveRecord::Migration[5.2]
  def change
    add_reference :visits, :visit_request, foreign_key: true
  end
end
