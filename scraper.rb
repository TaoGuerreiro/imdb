require 'open-uri'
require 'nokogiri'

# VERSION 1 😁

# def scrape_movies(number)

#   url = "https://www.imdb.com/chart/top/"
#   html_doc = Nokogiri::HTML(URI.open(url).read)

#   arr = []
#   a_title = []
#   a_year = []
#   a_rating = []

#     html_doc.search(".titleColumn a").first(number).each do |title|
#      a_title << title.text.strip
#     end
#     html_doc.search(".titleColumn span").first(number).each do |year|
#       a_year << year.text.strip.gsub("(", "").gsub(")", "").to_i
#       # "(1994)" => "1994" => 1995
#     end
#     html_doc.search(".ratingColumn strong").first(number).each do |rating|
#       a_rating << rating.text.strip.to_f
#     end

#     a_title.each_with_index do |_movie, index|
#       arr << {title: a_title[index], year: a_year[index], rating: a_rating[index] }
#     end
#     arr
# end

# VERSION 2 😎

def scrape_movies(number)
  url = 'https://www.imdb.com/chart/top'
  html_doc = Nokogiri::HTML(URI.open(url).read)
  movies = []

  html_doc.search('.lister-list tr').first(number).each do |element|
    title        = element.search('.titleColumn a').text.strip
    release_year = element.search('.secondaryInfo').text.strip.gsub('(', '').gsub(')', '').to_i
    rating       = element.search('.imdbRating strong').text.to_f
    movies << { title: title, year: release_year, rating: rating }
  end
  movies
end

# MINITESTS_____________________________________

# p scrape_movies(2).class  == Array
# p scrape_movies(2).size == 2
# p scrape_movies(2) == [
#                         {name: "Les Évadés", year: 1994, rating: 9.2  },
#                         {name: "Le Parrain", year: 1972, rating: 9.1  }
#                       ]
