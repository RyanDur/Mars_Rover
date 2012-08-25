module Navigation
  COMPASS = ["N","E","S","W"]
  DIRECTION = ["L","R","M"]
  MOVE = DIRECTION.last
  VALID_COMMANDS = ["N","E","S","W","L","R","M"]
  @compass_heading = COMPASS.clone

  # Returns array of VALID_COMMANDS
  def Navigation.VALID_COMMANDS
    VALID_COMMANDS
  end

  # Returns array COMPASS
  def Navigation.COMPASS
    COMPASS
  end

  # Returns array DIRECTION
  def Navigation.DIRECTION
    DIRECTION
  end

  # Returns new coordinate and heading based upon given instruction
  def Navigation.execute_move(move,coordinate)
    if MOVE == move
      Navigation.move(coordinate)
    else
      Navigation.change_heading(move,coordinate)
    end
  end

  # Moves coordinate based on heading
  def Navigation.move(coordinate)
    case coordinate.last
    when COMPASS[0]
      coordinate.add_value(1,1)
    when COMPASS[1]
      coordinate.add_value(0,1)
    when COMPASS[2]
      coordinate.subtract_value(1,1)
    else
      coordinate.subtract_value(0,1)
    end
  end

  # Move the compass heading so it matches
  # the heading of the current coordinate
  def Navigation.calibrate_compass(coordinate)
    if @compass_heading[0] == coordinate.last
      return @compass_heading
    end
    @compass_heading.shift_right
    Navigation.calibrate_compass(coordinate)
  end

  # Turns the coordinate left or right
  # based on current heading and instruction
  def Navigation.change_heading(direction,coordinate)
    Navigation.calibrate_compass(coordinate)
    if DIRECTION[0] == direction
      @compass_heading.shift_right
      coordinate[coordinate.length-1] = @compass_heading[0]
    else
      @compass_heading.shift_left
      coordinate[coordinate.length-1] = @compass_heading[0]
    end
    coordinate
  end
end
