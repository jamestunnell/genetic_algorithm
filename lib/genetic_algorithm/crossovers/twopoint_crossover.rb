module GeneticAlgorithm
  #requires that the #size, #clone, and #[] methods are implemented
  module TwopointCrossover
    def cross other
      raise ArgumentError, "size of other does not match size of self" if self.size != other.size
      raise RuntimeError, "genotype size must be greater than 2" if self.size <= 2
      
      a = self.clone
      b = other.clone
      point_1 = rand(1...(self.size-1))
      point_2 = rand(point_1...self.size)
      
      # swap
      a[0...point_1], b[0...point_1] = b[0...point_1], a[0...point_1]
      a[point_1...point_2], b[point_1...point_2] = b[point_1...point_2], a[point_1...point_2]
      a[point_2...a.size], b[point_2...b.size] = b[point_2...b.size], a[point_2...a.size]
      
      return a,b
    end
  end
end
