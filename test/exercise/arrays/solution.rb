module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array[0]
        array.each do |i|
          max = i if max < i
        end

        array.map! do |i|
          i.positive? ? max : i
        end
      end

      def search(_array, _query)
        low = 0
        high = _array.size - 1

        while low <= high
          mid = (low + high).div(2)
          mid_value = _array[mid]
          if mid_value == _query
            return mid
          elsif mid_value > _query
            high = mid - 1
          else
            low = mid + 1
          end
        end

        return -1
      end

    end
  end
end
