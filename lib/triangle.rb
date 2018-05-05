require "pry"

class Triangle

  def initialize(side_one, side_two, side_three)
    @side_one = side_one
    @side_two = side_two
    @side_three = side_three
  end

  def kind
    #binding.pry
    if self.triangle_test
      one_to_two = (@side_one == @side_two)
      one_to_three = (@side_one == @side_three)
      two_to_three = (@side_two == @side_three)
      if (one_to_two && one_to_three)
        :equilateral
      elsif (one_to_two || one_to_three || two_to_three)
        :isosceles
      else
        :scalene
      end
    else
      #begin
        raise TriangleError
      #rescue TriangleError => error
      #    puts error.message
      #end
    end
  end

  def triangle_test
   (@side_one > 0) && (@side_two > 0) &&
   (@side_three > 0) && ((@side_one + @side_two) > @side_three) &&
   ((@side_one + @side_three) > @side_two) &&
   ((@side_two + @side_three) > @side_one)
  end

  class TriangleError < StandardError
    def message
      "That's not a triangle dummy!"
    end
  end

end
