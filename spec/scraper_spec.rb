require_relative '../scraper'

describe '#scrape_movies' do
  it 'returns an Array' do
    array_class = scrape_movies(2).class
    expected = Array
    expect(array_class).to eq(expected)
  end

  it 'return the right amount of movies' do
    number = scrape_movies(2).size
    expected = 2
    expect(number).to eq(expected)
  end

  it 'return the right movies' do
    movies = scrape_movies(2)
    expected = [
      { title: 'Les Évadés', year: 1994, rating: 9.2  },
      { title: 'Le Parrain', year: 1972, rating: 9.1  }
    ]
    expect(movies).to eq(expected)
  end
end
