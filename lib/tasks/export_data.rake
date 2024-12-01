namespace :export do
  desc "Export bakeries to bakeries.json"
  task bakeries: :environment do
    bakeries = Bakery.all
      File.open("db/bakeries.json", "w") do |f|
        f.write(bakeries.to_json)
      end
    puts "Bakeries exported to db/bakeries.json"
  end

  desc "Export caterers to caterers.json"
  task caterers: :environment do
    caterers = Caterer.all
      File.open("db/caterers.json", "w") do |f|
        f.write(caterers.to_json)
      end
    puts "Caterers exported to db/caterers.json"
  end

  desc "Export coordinators to coordinators.json"
  task coordinators: :environment do
    coordinators = Coordinator.all
      File.open("db/coordinators.json", "w") do |f|
        f.write(coordinators.to_json)
      end
    puts "Coordinators exported to db/coordinators.json"
  end

  desc "Export cuisines to cuisines.json"
  task cuisines: :environment do
    cuisines = Cuisine.all
      File.open("db/cuisines.json", "w") do |f|
        f.write(cuisines.to_json)
      end
    puts "Cuisines exported to db/cuisines.json"
  end

  desc "Export djs to djs.json"
  task djs: :environment do
    djs = Dj.all
      File.open("db/djs.json", "w") do |f|
        f.write(djs.to_json)
      end
    puts "DJs exported to db/djs.json"
  end

  desc "Export events to events.json"
  task events: :environment do
    events = Event.all
      File.open("db/events.json", "w") do |f|
        f.write(events.to_json)
      end
    puts "Events exported to db/events.json"
  end

  desc "Export florists to florists.json"
  task florists: :environment do
    florists = Florist.all
      File.open("db/florists.json", "w") do |f|
        f.write(florists.to_json)
      end
    puts "Florists exported to db/florists.json"
  end

  desc "Export hotels to hotels.json"
  task hotels: :environment do
    hotels = Hotel.all
      File.open("db/hotels.json", "w") do |f|
        f.write(hotels.to_json)
      end
    puts "Hotels exported to db/hotels.json"
  end

  desc "Export invites to invites.json"
  task invites: :environment do
    invites = Invite.all
      File.open("db/invites.json", "w") do |f|
        f.write(invites.to_json)
      end
    puts "Invites exported to db/invites.json"
  end

  desc "Export lighting_production_companies to lighting_production_companies.json"
  task lighting_production_companies: :environment do
    lighting_production_companies = LightingProductionCompany.all
      File.open("db/lighting_production_companies.json", "w") do |f|
        f.write(lighting_production_companies.to_json)
      end
    puts "Lighting/Production companies exported to db/lighting_production_companies.json"
  end

  desc "Export meals to meals.json"
  task meals: :environment do
    meals = Meal.all
      File.open("db/meals.json", "w") do |f|
        f.write(meals.to_json)
      end
    puts "Meals exported to db/meals.json"
  end

  desc "Export neighborhoods to neighborhoods.json"
  task neighborhoods: :environment do
    neighborhoods = Neighborhood.all
      File.open("db/neighborhoods.json", "w") do |f|
        f.write(neighborhoods.to_json)
      end
    puts "Neighborhoods exported to db/neighborhoods.json"
  end

  desc "Export photographers to photographers.json"
  task photographers: :environment do
    photographers = Photographer.all
      File.open("db/photographers.json", "w") do |f|
        f.write(photographers.to_json)
      end
    puts "Photographers exported to db/photographers.json"
  end

  desc "Export rsvps to rsvps.json"
  task rsvps: :environment do
    rsvps = Rsvp.all
      File.open("db/rsvps.json", "w") do |f|
        f.write(rsvps.to_json)
      end
    puts "RSVPs exported to db/rsvps.json"
  end

  desc "Export transportation_companies to transportation_companies.json"
  task transportation_companies: :environment do
    transportation_companies = TransportationCompany.all
      File.open("db/transportation_companies.json", "w") do |f|
        f.write(transportation_companies.to_json)
      end
    puts "Transportation Companies exported to db/transportation_companies.json"
  end

  desc "Export venues to venues.json"
  task venues: :environment do
    venues = Venue.all
      File.open("db/venues.json", "w") do |f|
        f.write(venues.to_json)
      end
    puts "Venues exported to db/venues.json"
  end
end
