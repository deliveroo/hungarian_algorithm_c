require 'hungarian_algorithm_c.so'

module HungarianAlgorithmC
  class << self
    def find_pairings(array)
      validate!(array)
      pairs(array.flatten, array.size)
    end

    def validate!(array)
      return if rectangular?(array)
      raise ArgumentError.new('array must be rectangular')
    end

    def rectangular?(array)
      row_size = array.size
      array.all? { |column| row_size == column.size }
    end

    private :pairs, :validate!, :rectangular?
  end
end
