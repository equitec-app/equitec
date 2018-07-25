module CustomersHelper
  def get_customers_with_power_plants(power_plants)
    customers_with_power_plants = []
    power_plants.each do |power_plant|
      if !customers_with_power_plants.include?(power_plant.customer) then customers_with_power_plants.push(power_plant.customer) end
    end
    return customers_with_power_plants
  end

  def get_customers_with_ups(upss)
    customers_with_ups = []
    upss.each do |ups|
      if !customers_with_ups.include?(ups.customer) then customers_with_ups.push(ups.customer) end
    end
    return customers_with_ups
  end

  def get_headquarters_with_power_plants(power_plants)
    headquarters_with_power_plants = []
    power_plants.each do |power_plant|
      if !headquarters_with_power_plants.include?(power_plant.headquarter) then headquarters_with_power_plants.push(power_plant.headquarter) end
    end
    return headquarters_with_power_plants
  end

  def get_headquarters_with_upss(upss)
    headquarters_with_upss = []
    upss.each do |ups|
      if !headquarters_with_upss.include?(ups.headquarter) then headquarters_with_upss.push(ups.headquarter) end
    end
    return headquarters_with_upss
  end

  def get_upss_in_headquarter(upss, headquarter)
    upss_in_headquarter = []
    headquarter.ups.each do |ups|
      if upss.include?(ups) then upss_in_headquarter.push(ups) end
    end
    return upss_in_headquarter
  end

  def get_power_plants_in_headquarter(power_plants, headquarter)
    power_plants_in_headquarter = []
    headquarter.power_plants.each do |power_plant|
      if power_plants.include?(power_plant) then power_plants_in_headquarter.push(power_plant) end
    end
    return power_plants_in_headquarter
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

  def number_of_rowspan_ups(customer, upss)
    headquarters = get_headquarters_with_upss(upss)

    count = 0
    customer.ups.each do |ups|
      if upss.include?(ups) then count = count++1 end
    end

    count2 = 0
    customer.headquarters.each do |customer_headquarter|
      if headquarters.include?(customer_headquarter) then count2 = count2++1 end
    end

    count + (count2 * 2)
  end
end
