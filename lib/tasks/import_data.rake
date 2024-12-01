# To update if data needs to be imported.

# namespace :import do
#   desc "Import movies from movies.json"
#   task movies: :environment do
#     file = File.read("db/movies.json")
#     movies = JSON.parse(file)
#     movies.each do |movie_data|
#       movie = Movie.new(movie_data)
#       movie.save
#     end
#     puts "Movies imported from db/movies.json"
#   end

# end
