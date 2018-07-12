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
end
