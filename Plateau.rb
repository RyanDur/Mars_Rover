require_relative 'My_Matrix'

class Plateau < My_Matrix
  
  # Returns a new Plateau object
  # and adds one to the x,y
  def initialize(x,y)
    super(x+1,y+1)
  end
end
