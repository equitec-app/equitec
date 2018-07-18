module PowerPlantsHelper
  def headquarters_array(customer)
    array = []
    customer.headquarters.each do |headquarter|
      array.push([headquarter.city + ', '+headquarter.direction, headquarter.id])
    end
    return array
  end
end
