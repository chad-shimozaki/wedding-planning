# lib/tasks/export_data.rake
namespace :export do
  desc "Export data tables to JSON files"
  task all: :environment do
    # Define the tables and their corresponding models
    tables = {
      bakeries: Bakery,
      caterers: Caterer,
      coordinators: Coordinator,
      cuisines: Cuisine,
      djs: Dj,
      events: Event,
      florists: Florist,
      foods: Food,
      hotels: Hotel,
      invites: Invite,
      lighting_production_companies: LightingProductionCompany,
      meals: Meal,
      neighborhoods: Neighborhood,
      photographers: Photographer,
      rsvps: Rsvp,
      transportation_companies: TransportationCompany,
      users: User,
      venues: Venue
    }

    # Iterate through each table
    tables.each do |table_name, model|
      # Fetch all records for the current table
      records = model.all

      # Export to JSON file
      file_path = "db/#{table_name}.json"
      File.open(file_path, "w") do |f|
        f.write(records.to_json)
      end

      puts "#{table_name.to_s.capitalize} exported to #{file_path}"
    end
  end
end
