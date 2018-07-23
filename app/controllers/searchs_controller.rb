class SearchsController < ApplicationController
  def customers
    @customers = Customer.all.where("username ILIKE ? ", "%#{params[:concept]}%")
  end

  def power_plants
    @customers = Customer.all.where("username ILIKE ? ", "%#{params[:concept]}%")
    @headquarters = Headquarter.all.where("city ILIKE ? OR direction ILIKE ? ", "%#{params[:concept]}%", "%#{params[:concept]}%")
    @searched_power_plants = PowerPlant.all.where("trademark ILIKE ? OR model ILIKE ? OR plate ILIKE ?", "%#{params[:concept]}%", "%#{params[:concept]}%", "%#{params[:concept]}%")


    @power_plants = []

    puts "CLIENTES"
    @customers.each do |customer|
      if customer.power_plants.size > 0 then @power_plants = @power_plants + customer.power_plants end
    end
    puts "SEDES"
    @headquarters.each do |headquarter|
      if headquarter.power_plants.size > 0 then @power_plants = @power_plants + headquarter.power_plants end
    end
    puts "PLANTAS"
    puts @searched_power_plants

    puts "TODAS LAS PLANTAS"
    @power_plants = @searched_power_plants + @power_plants
    puts @power_plants
  end

  def ups
  end
end
