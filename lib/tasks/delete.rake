namespace :delete do
  desc "TODO"
  task employees: :environment do
    Employee.all.delete_all
  end

  desc "TODO"
  task customers: :environment do
    Agreement.all.delete_all
    Customer.all.delete_all
  end

end
