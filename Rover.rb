require_relative 'Navigation'

class Rover
  attr_accessor :coordinate
  attr_reader :name, :command, :path_log, :tag, :home_coordinate

  # Return a new Rover object
  # Initializes the variables that create Rover
  def initialize(command, home_coordinate, num)
    @path_log = []
    @tag = num
    @command = command
    @name = "Rover #{num}"
    @home_coordinate = home_coordinate.clone
    @coordinate = @home_coordinate.clone
  end

  # Logs the place the rover was in and
  # Return new coordinates based on instruction
  def move(m)
    @path_log.push(@coordinate.clone)
    @coordinate = Navigation.execute_move(m,@coordinate)
  end

  # Prints the past path coordinates collected to the screen
  def print_path
    @path.each{|x| puts x.inspect}
  end

  # Prints the current coordinate of the rover
  def print_rover
    puts "#{coordinate[0]} #{coordinate[1]} #{coordinate[2]}"
  end
end
