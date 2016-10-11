# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb

def checkTriangleSides(a,b,c)
  return a > 0 && b > 0 && c > 0
end

def checkSidesSum(a,b,c)
  return a+b > c && a+c > b && b+c > a
end

def checkIsValidTriangle(a,b,c)
  return checkSidesSum(a,b,c) && checkTriangleSides(a,b,c)
end

def isEquilateral(a,b,c)
  return a === b && a === c && b === c
end

def isScalene(a,b,c)
  return a != b && a != c && b != c
end

def isIsosceles(a,b,c)
  # IF both are the same is because both are false, so is isosceles.
  return isScalene(a,b,c) == isEquilateral(a,b,c)
end

def getDifferentSides(a,b,c)
  values = Hash.new(0)

  values[a] += 1
  values[b] += 1
  values[c] += 1

  return values.length
end

def triangleType(a,b,c)
  unless checkIsValidTriangle(a,b,c)
    raise TriangleError
  end

  if isEquilateral(a,b,c) then
    return :equilateral
  end

  if isScalene(a,b,c) then
    return :scalene
  end

  return :isosceles
end

def triangleType2(a,b,c)
  unless checkIsValidTriangle(a,b,c)
    raise TriangleError
  end

  differentSides = getDifferentSides(a,b,c)

  case differentSides
  when 1
    return :equilateral
  when 2
    return :isosceles
  else
    return :scalene
  end
end

def triangle(a, b, c)
  return triangleType(a,b,c)
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
