require_relative 'scraper'
# Avoir une APP qui nous donne les X films de l'index IMDB
# 1 Demander à l'user combien de films il souhaite afficher
print 'Combien de films souhaitez-vous afficher ?'
puts '>'
# 2 Récupere la valeur
number = gets.chomp.to_i

# 3 Scrapper les données
movies = scrape_movies(number)
# on veut récuperer un tableau de hash
# movies =   [
#     {title: "Les Évadés", year: "1994", rating: "9,2"  },
#     {title: "Le Parrain", year: "1972", rating: "9,1"  }
#   ]

# 4 Afficher les résultats
movies.each do |film|
  puts "#{film[:title]}, release in #{film[:year]} with a rating of #{film[:rating]}"
end
