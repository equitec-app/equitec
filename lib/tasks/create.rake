namespace :create do
  desc "TODO"
  task employees: :environment do
    Employee.create(email:'andres.uribe@equitec.cc', username:'Andres Uribe',phone:'302 829 1232', password:'123456', password_confirmation:'123456', role: 4)
    Employee.create(email:'edavid697@hotmail.com', username:'David',phone:'302 829 1232', password:'123456', password_confirmation:'123456', role: 4)
    Employee.create(email:'servicioequitec1@equitec.cc', username:'Laura Camachoe',phone:'302 829 1232', password:'123456', password_confirmation:'123456', role: 0)
    Employee.create(email:'rodrigo_linares@equitec.cc', username:'Rodrigo Linares',phone:'302 829 1232', password:'123456', password_confirmation:'123456', role: 2)
    Employee.create(email:'ferney.suarez@equitec.cc', username:'Ferney Suarez',phone:'302 829 1232', password:'123456', password_confirmation:'123456', role: 2)
    Employee.create(email:'tecnico1@equitec.cc', username:'Pedro Picapiedra',phone:'302 829 1232', password:'123456', password_confirmation:'123456', role: 2)
    Employee.create(email:'tecnico2@equitec.cc', username:'Optimus Prime',phone:'302 829 1232', password:'123456', password_confirmation:'123456', role: 2)
  end

  desc "TODO"
  task customers: :environment do
    10.times do |i|
      puts "Creando cliente #{i.to_s}"
      c = Customer.create(email: "cliente#{i.to_s}@gmail.com",
      username: "Cliente #{i.to_s}",
      password:'123456',
      password_confirmation:'123456',
      nit: Faker::IDNumber.valid,
      legal_agent: Faker::Name.name_with_middle,
      legal_agent_mail: Faker::Internet.email,
      legal_agent_phone: Faker::PhoneNumber.cell_phone,
      mainteance_agent: Faker::Name.name_with_middle,
      mainteance_phone: Faker::PhoneNumber.cell_phone,
      payments_mail: Faker::Internet.email,
      payments_manager: Faker::DragonBall.character,
      payments_phone: Faker::PhoneNumber.cell_phone,
      phone: Faker::PhoneNumber.cell_phone,
      principal_direction: Faker::Address.full_address)

      puts c.errors.full_messages
    end
  end

  desc "TODO"
  task headquarters: :environment do
    Customer.all.each do |customer|
      5.times do |i|
        customer.headquarters.create(city:"Bogotá", direction: Faker::Address.full_address, phone:Faker::PhoneNumber.cell_phone)
      end
    end
  end

  desc "TODO"
  task visit_requests: :environment do
    Headquarter.all.each do |headquarter|
      h = headquarter.visit_requests.create(
        requested_money: nil,
        requested_supplies: "",
        concept: "Mantenimiento tipo1",
        comment: "",
        oil_filter: nil,
        oil: nil,
        air_filter: nil,
        fuel_filter: nil,
        water_filter: nil,
        coolant: nil,
        battery: nil,
        fuel: nil,
        mechanical_fail: nil,
        up_ids: [Up.last.id, Up.first.id],
        power_plant_ids: [PowerPlant.last.id, PowerPlant.first.id])
      puts h
    end
  end

  task visits: :environment do
    headquarters = Headquarter.all
    v1 = Visit.create(visit_day: Date.today, visit_time: '11:11' , headquarter_id: headquarters[rand(0..(headquarters.size-1))].id)
    puts v1.errors.full_messages
    asign = v1.assignments.create(employee_id: Employee.all[3].id)
    asign = v1.assignments.create(employee_id: Employee.all[4].id)
    puts asign.errors.full_messages
  end
end
# Time.now.strftime!('%H:%M')
