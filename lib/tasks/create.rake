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
      phone: Faker::PhoneNumber.cell_phone)

      puts c.errors.full_messages
    end
  end

end

#  cost_center            :string
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  legal_agent            :string
#  legal_agent_mail       :string
#  legal_agent_phone      :string
#  mainteance_agent       :string
#  mainteance_phone       :string
#  nit                    :string
#  payments_mail          :string
#  payments_manager       :string
#  payments_phone         :string
#  phone                  :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  username               :string
