module ApplicationHelper
  def role_spanish_name(string)
    if string == 'admin'
      return "Administrador"
    elsif string == 'engineer'
      return 'Ingeniero'
    elsif string == 'account_manager'
      return 'Jefe de cuenta'
    elsif string == 'seller'
      return 'Vendedor'
    elsif string == 'technician'
      return 'Técnico'
    end
  end

  def number_of_rowspan_power_plant(customer)
    headquarters = []
    customer.headquarters.each do |headquarter|
      if headquarter.power_plants.size > 0 then headquarters.push(headquarter) end
    end

    customer.power_plants.size + (headquarters.length * 2)
  end

  def number_of_rowspan_ups(customer)
    headquarters = []
    customer.headquarters.each do |headquarter|
      if headquarter.ups.size > 0 then headquarters.push(headquarter) end
    end

    customer.ups.size + (headquarters.length * 2)
  end
end
