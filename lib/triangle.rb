require 'pry'

class Triangle
  attr_accessor :sides
  def initialize(side_one, side_two, side_three)
    @sides = []
    @sides << side_one
    @sides << side_two
    @sides << side_three
  end

  def triangle_type
      return :equilateral if self.sides.uniq.length == 1
      return :isosceles if self.sides.uniq.length == 2
      return :scalene if self.sides.uniq.length == 3
  end

  def illegal_sides
    self.sides.any? { |s| s <= 0 }
  end

  def inequality
    sorted_sides = self.sides.sort
    sorted_sides.last >= sorted_sides[0..1].inject(:+)
  end

  def kind
    if  illegal_sides || inequality
      raise TriangleError
    else 
        triangle_type
    end
  end

  class TriangleError < StandardError
    def message
      "THIS IS NOT A TRIANGLE"
    end
  end
end
