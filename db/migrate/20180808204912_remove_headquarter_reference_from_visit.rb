class RemoveHeadquarterReferenceFromVisit < ActiveRecord::Migration[5.2]
  def change
    remove_reference :visits, :headquarter, foreign_key: true
  end
end
