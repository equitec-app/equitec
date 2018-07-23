module CustomersHelper
  def get_customers_with_power_plants(power_plants)
    customers_with_power_plants = []
    power_plants.each do |power_plant|
      if !customers_with_power_plants.include?(power_plant.customer) then customers_with_power_plants.push(power_plant.customer) end
    end
    return customers_with_power_plants
  end

  def get_headquarters_with_power_plants(power_plants)
    headquarters_with_power_plants = []
    power_plants.each do |power_plant|
      if !headquarters_with_power_plants.include?(power_plant.headquarter) then headquarters_with_power_plants.push(power_plant.headquarter) end
    end
    return headquarters_with_power_plants
  end

  def number_of_rowspan_power_plant(customer, power_plants)
    headquarters = get_headquarters_with_power_plants(power_plants)

    count = 0
    customer.power_plants.each do |power_plant|
      if power_plants.include?(power_plant) then count = count++1 end
    end

    count2 = 0
    customer.headquarters.each do |customer_headquarter|
      if headquarters.include?(customer_headquarter) then count2 = count2++1 end
    end

    count + (count2 * 2)
  end

  def number_of_rowspan_ups(customer)
    headquarters = []
    customer.headquarters.each do |headquarter|
      if headquarter.ups.size > 0 then headquarters.push(headquarter) end
    end

    customer.ups.size + (headquarters.length * 2)
  end
end
