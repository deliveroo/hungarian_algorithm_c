require_relative './hungarian_algorithm_c.so'

module HungarianAlgorithmC
  # Limits for 'signed long long int' C data type
  LIMITS = {
    positive: +9_223_372_036_854_775_807,
    negative: -9_223_372_036_854_775_807
  }
  private_constant :LIMITS

  class << self
    def find_pairings(matrix)
      validate!(matrix)
      array = value_capped_flattened_array(matrix)
      pairs(array, matrix.size)
    end

    def value_capped_flattened_array(matrix)
      [].tap do |array|
        matrix.each do |row|
          row.each do |element|
            array << begin
              if element > LIMITS[:positive]
                LIMITS[:positive]
              elsif element < LIMITS[:negative]
                LIMITS[:negative]
              else
                element
              end
            end
          end
        end
      end
    end

    def validate!(matrix)
      return if rectangular?(matrix)
      raise ArgumentError.new('matrix must be rectangular')
    end

    def rectangular?(matrix)
      row_size = matrix.size
      matrix.all? { |column| row_size == column.size }
    end

    private :pairs, :validate!, :rectangular?, :value_capped_flattened_array
  end
end
