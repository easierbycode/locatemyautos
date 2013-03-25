require 'faker'

class FakeData
  def self.create

    [DealerGroup, DealerCompany, DealerLot, Vehicle, Device, VehicleAssignment].map(&:delete_all)

    ['gotham', 'superior'].each do |subdomain|
      dealer_group = DealerGroup.new subdomain: subdomain
      c = dealer_group.connection

      c.schema_search_path = "public"

      dealer_group.save!

      c.schema_search_path = "#{dealer_group[:subdomain]}"

      create_companies(dealer_group)
    end
  end

  def self.create_companies(dealer_group)

    regions = ["pacific", "central", "eastern"]
    latitude = 33.675908
    longitude = -111.886777
    vehicle_types = [:new, :used]
    vehicle_locations = [:dealer_lot, :port_of_entry, :in_transit]

    colors = [:black, :white, :grey, :blue, :red]

    4.times do |n|
      company = DealerCompany.create({ name: "Dealer #{n}", dealer_group: dealer_group })

      # create 8-15 lots per company
      rand(8..15).times do |count|

        DealerLot.create({
          name: "Dealer Lot #{count}",
          dealer_company: company,
          region: regions[rand(0..2)],
          country: "United States",
          state: Faker::Address.state_abbr,
          city: Faker::Address.city,
          address: Faker::Address.street_address,
          latitude: latitude,
          longitude: longitude
        })

        start_imei = 4530000000

        # create 20-60 vehicles for each lot
        rand(20..60).times do
          type = vehicle_types.shuffle.first
          acquired_date = rand(2..8).months.ago
          ship_start = acquired_date + rand(5..10).days
          ship_end = ship_start + rand(5..30).days
          vehicle_usage = rand_usage
          vehicle_status = rand_status(vehicle_usage)

          vehicle = Vehicle.create({
            vin: ([*('A'..'Z'),*('0'..'9')]-%w(0 1 I O)).sample(17).join,
            acquired_date: acquired_date,
            sold_date: sold_date(vehicle_status, ship_end, vehicle_usage),
            vehicle_type: type,
            vehicle_usage: vehicle_usage,
            vehicle_status: vehicle_status,
            vehicle_location: vehicle_locations.shuffle.first,
            car_id: rand(1..999),
            car_color: colors.shuffle.first,
            vehicle_mileage: mi_by_type(type),
            garage_loc_lat: latitude,
            garage_loc_long: longitude,
            ship_start: ship_start,
            ship_end: ship_end
          })

          device = Device.create({
            imei: (start_imei+vehicle.id).to_s
          })

          VehicleAssignment.create({
            device_id: device.id,
            vehicle_id: vehicle.id,
            start_at: Time.at(vehicle.acquired_date)
          })
        end

      end
    end
  end


  # HELPER METHODS
  def self.mi_by_type(type)
    if type == :new
      return rand(5..60)
    else
      return rand(5000.80000)
    end
  end

  def self.sold_date(vehicle_status, ship_end, vehicle_usage)
    if vehicle_status == :sold && vehicle_usage == :inventory
      return ship_end + rand(20..100).days
    else
      return nil
    end
  end

  def self.rand_usage
    n = rand(0..100)

    if n >= 95
      return :rental
    elsif n >= 90
      return :fleet
    else
      return :inventory
    end
  end

# status can't be sold unless vehicle_usage is :inventory
  def self.rand_status(vehicle_usage)
    if vehicle_usage == :inventory
      return [:repair_service, :in_transit, :for_sale, :sold].shuffle.first
    else
      return [:repair_service, :in_transit].shuffle.first
    end
  end
end