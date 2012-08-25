require_relative 'Navigation'
require_relative 'Rover'
require_relative 'Plateau'

class Rover_Controller
  attr_reader :rover_bay, :map

  # Returns a new instance of a Rover_Controller object
  # It takes the first element of the command_structure array
  # and creates a new two dimensional array
  # Create the rovers based on the number of command objects given
  # Place the rovers based on the coordinates
  # provided by the command object
  def initialize(commands)
    m = commands.shift
    @map = Plateau.new(m[0],m[1])
    create_rover(commands)
    initial_placement
  end

  # Each rover moves its full path one at a time
  # Check to see if the path is valid
  # Raise an error if path is not within the boundary or
  # if there is a collision along the path
  def explore
     rover_bay.each do |r|
      if pass_path_check?(r)
        move(r)
      else
        raise "There is a collision\nin placement #{r.coordinate.inspect}, please revise instruction set #{r.command.inspect}"
      end
    end
  end

  # Place the rovers based on the coordinates
  # provided by the command object
  # If passes Initial placement check
  # Else Throw error if there is a collision in placement
  def initial_placement
    rover_bay.each do |r|
      if pass_initial_placement_check?(r)
        place_rover(r)
      else
        raise "There is a collision\nin placement #{r.coordinate.inspect}"
      end
    end
  end

  # Move a rover based on the command list given from the file
  # by removing it from the map and placing it in its new spot
  def move(rover)
    rover.command.each do |m|
      remove_rover(rover)
      rover.move(m)
      place_rover(rover)
    end
  end

  # Create the rovers based on the number of command objects given
  def create_rover(c)
    @rover_bay = []
    c.each_with_index do |x,i|
        @rover_bay.push(Rover.new(x.movement,x.position,i+1))
    end
  end

  # Return true if not placing one rover atop another
  # Else Throw Error 
  def pass_initial_placement_check?(rover)
    if pass_collision_check?(rover.coordinate,rover)
      return true
    end
    raise "Collision Detected\nplease revise initial placement #{x.coordinate.inspect}"
  end

  # Return true if there is no collision
  def pass_collision_check?(pos,obj)
    if (@map[pos[0],pos[1]].nil?)
      return true
    elsif (@map[pos[0],pos[1]] == obj)
      return true
    end
    false
  end

  # Return true if the coordinate is within the prescribed boundary
  def pass_boundary_check?(coordinate)
    coordinate.each do |c|
      if c.is_i?
        if c < 0
          return false
        elsif c > @map.my_matrix.length-1
          return false
        elsif c > @map.my_matrix[0].length-1
          return false
        end
      end
    end
    true
  end

  # Check to see if the path is valid
  # By checking the boundary and
  # collision check
  def pass_path_check?(rover)
    temp = rover.coordinate.clone
    rover.command.each do |c|
      temp = Navigation.execute_move(c,temp)
      if not pass_boundary_check?(temp)
        if not pass_collision_check?(temp,rover)
          return false
        end
      end
    end
    true
  end

  # Remove the rover from the map coordinate it inhabits
  def remove_rover(r)
    @map[r.coordinate[0],r.coordinate[1]] = nil
  end

  # Place the rover in its new coordinates
  def place_rover(r)
     @map[r.coordinate[0],r.coordinate[1]] = r
  end

  # Tell each rover to print its current
  # coordinate to the screen
  def rover_controller_report
    @rover_bay.each{|x|  x.print_rover}
  end
end
