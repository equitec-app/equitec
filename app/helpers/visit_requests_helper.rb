module VisitRequestsHelper
  def type_of_equipment(equipment)
    if equipment.class == PowerPlant
      "Planta electrica"
    elsif equipment.class == Up
      "UPS"
    else
      "No definido"
    end
  end
end
