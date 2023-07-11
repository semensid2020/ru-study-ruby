module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def countries_number(record)
        record['country']&.split(',')&.count || 0
      end

      def accounted_in_rating?(record)
        record['rating_kinopoisk'].to_f.positive? && countries_number(record) > 1
      end

      def rating(array)
        ratings_filtered = array.select { |f| accounted_in_rating?(f) }
                                .map { |f| f['rating_kinopoisk'].to_f }

        ratings_filtered.reduce(:+) / ratings_filtered.size
      end

      def chars_count(films, threshold)
        films.select { |f| f['rating_kinopoisk'].to_f >= threshold }
             .map { |f| f['name'].count('и') }
             .reduce(:+)
      end
    end
  end
end
