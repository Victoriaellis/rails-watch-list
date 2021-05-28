# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
Bookmark.destroy_all
Movie.destroy_all

url = 'http://tmdb.lewagon.com/movie/top_rated'
movie_serialized = URI.open(url).read
movie = JSON.parse(movie_serialized)
movie_list = movie["results"]
# puts movie_list

movie_list.each do |movie|
  # puts movie["title"]
  # puts movie["overview"]
  # puts movie["poster_path"]
  # puts movie["vote_average"]
  Movie.create!(title: movie["title"], overview: movie["overview"], poster_url: movie["poster_path"], rating: movie["vote_average"])
end
