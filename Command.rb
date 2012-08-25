class Command
  attr_reader :position, :movement

  # Returns a new Command object
  # Set the position
  # Set the movement instruction
  def initialize(position,movement)
    @position = position.clone
    @movement = movement.clone
  end

  #position
  #Return position

  #movement
  #Return Movement
end
