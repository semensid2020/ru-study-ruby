module Exercise
  module Arrays
    class << self
      def replace(array)
        max = find_max(array)

        array.map { |i| i.positive? ? max : i }
      end

      def find_max(arr)
        max = arr[0]
        arr.each { |i| max = i if max < i }

        max
      end

      def search(array, query, shift = 0)
        size = array.size
        half_index = size.div(2)

        return -1 if (size == 0 || array[-1] < query || array[0] > query)
        return shift if array[0] == query
        return (shift + size - 1) if array[-1] == query
        return (shift + half_index) if array[half_index] == query

        return search(array[0..(half_index - 1)], query, shift) if array[half_index] > query
        return search(array[(half_index + 1)..-1], query, shift + half_index + 1) if array[half_index] < query
      end

    end
  end
end
