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
  end

end
