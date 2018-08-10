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
    7.times do |i|
      day = (date_today + (week.to_i * 7)) + i
      visits_per_day = search_employee.visits.where('visit_date BETWEEN ? AND ?', day.beginning_of_day, day.end_of_day ).size
      # puts "VISITAS POR DIA #{visits_per_day}/// DIA #{day}"
      if visits_per_day > max_visits then max_visits = visits_per_day end
    end
    return max_visits
  end

  def employee_scheduler_per_day(search_employee, day, i)
    visits_of_the_day = search_employee.visits.where('visit_date BETWEEN ? AND ?', day.beginning_of_day, day.end_of_day )

    return visits_of_the_day[i].nil? ? "Libre" : visits_of_the_day[i].visit_request.headquarter.customer.username.to_s + ', ' + visits_of_the_day[i].visit_request.headquarter.city.to_s + ' ' + visits_of_the_day[i].visit_request.headquarter.direction.to_s

  end
end
