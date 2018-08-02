module VisitsHelper
  def technicians_of_a_visit(employees)
    technicians_array = []
    employees.each do |employee|
      technicians_array.push(employee.username)
    end
    return technicians_array.join(", ")
  end
end
