namespace :export do
  desc "Export bakeries to bakeries.json"
  task bakeries: :environment do
    bakeries = Bakery.all
      File.open("db/bakeries.json", "w") do |f|
        f.write(bakeries.to_json)
      end
    puts "Bakeries exported to db/bakeries.json"
  end
end
