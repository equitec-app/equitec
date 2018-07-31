module HeadquartersHelper
  def equipments(headquarter)
    headquarter.power_plants + headquarter.ups
  end
end
