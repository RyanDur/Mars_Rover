class My_Matrix
  attr_reader :my_matrix

  # Returns a My_Matrix
  # Creates a two dimensional array
  def initialize(x, y)
    @my_matrix = Array.new(x).map!{ Array.new(y) }
  end

  # Returns the value at the x,y position
  def [](x,y)
    @my_matrix[x][y]
  end
  
  # Sets the x,y position
  def []=(x,y,value)
    @my_matrix[x][y] = value
  end
end
