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
    customer.power_plants.size + (customer.headquarters.length * 2)
  end

  def number_of_rowspan_ups(customer)
    customer.ups.size + (customer.headquarters.length * 2)
  end
end
