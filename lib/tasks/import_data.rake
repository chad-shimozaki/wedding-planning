# lib/tasks/import_data.rake
namespace :import do
  desc "Import data tables from JSON files"
  task all: :environment do
    # Define the tables and their corresponding models
    tables = {
      neighborhoods: Neighborhood,
      cuisines: Cuisine,
      bakeries: Bakery,
      caterers: Caterer,
      coordinators: Coordinator,
      djs: Dj,
      florists: Florist,
      hotels: Hotel,
      lighting_production_companies: LightingProductionCompany,
      photographers: Photographer,
      transportation_companies: TransportationCompany,
      users: User,
      invites: Invite,
      rsvps: Rsvp,
      venues: Venue,
      foods: Food,
      events: Event,
      meals: Meal,
    }

    tables.each do |table_name, model|
      file_path = "db/#{table_name}.json"

      # Check if the JSON file exists
      if File.exist?(file_path)
        # Parse JSON data
        data = JSON.parse(File.read(file_path))

        # Import records
        data.each do |record|
          model.create!(record)
        end

        puts "#{table_name.to_s.capitalize} imported successfully from #{file_path}"
      else
        puts "File #{file_path} not found. Skipping #{table_name.to_s.capitalize}."
      end
    end
  end
end
