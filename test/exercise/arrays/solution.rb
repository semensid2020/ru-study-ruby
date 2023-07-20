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

      def search(array, query, left = 0, right = array.size - 1)
        return -1 if left > right || array[left] > query || array[right] < query
        return left if array[left] == query
        return right if array[right] == query

        half_index = left + (right - left) / 2
        return half_index if array[half_index] == query

        return search(array, query, left, half_index - 1) if array[half_index] > query
        search(array, query, half_index + 1, right)
      end
    end
  end
end
