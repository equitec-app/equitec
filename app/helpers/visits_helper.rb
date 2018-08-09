module VisitsHelper
  def technicians_of_a_visit(employees)
    technicians_array = []
    employees.each do |employee|
      technicians_array.push(employee.username)
    end
    return technicians_array.join(", ")
  end

  def max_number_of_visits_per_day(search_employee, date_today, week)
    max_visits = 1
    7.times do
      visits_per_day = search_employee.visits.where(visit_date_time: (date_today + (week.to_i * 7))).size
      if visits_per_day > max_visits then max_visits = visits_per_day end
    end
    return max_visits
  end
end
