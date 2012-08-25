require_relative 'Navigation'
require_relative 'Command'
require_relative 'Add_Ons'

class Command_File
  attr_accessor :lines, :command, :command_structure

  # Returns a new Command_File object
  # It fills an array with lines of text
  # Processes the lines of text into a command structure
  def initialize(file)
    @lines = []
    command_file = File.open(file)
    command_file.each_line{|x| @lines.push(x.chomp)}
    command_file.close
    process_command_file.g
  end

  # Return true if commands within the
  # command_structure array are valid
  # by checking the xy coordinates, text
  # within the file and the command objects
  def valid_command_structure?
    if (valid_xy?(@command_structure[0]) && valid_text? && valid_commands?)
      return true
    else
      return false
    end
  end

  # Processes the lines of text into a command structure
  # by gathering the commands and creating a command structure
  def process_command_file
    gather_command
    create_command_structure
  end

  # Gather the lines and splits them into a command array
  # checking for integers and converting them
  def gather_command
    @command = []
    @lines.each do |x|
      if x[0,1].is_i?
        @command.push(x.split(/ /).s_to_i)
      else
        @command.push(x.split(//))
      end
    end
  end

  # Takes the the first element, which is the size of the field,
  # and then takes every odd index
  # putiing every two commands into a command object
  # and pushing them into the command_structure array
  def create_command_structure
    @command_structure = []
    @command_structure.push(@command[0])
    for i in 1...@command.length-1
      if i.odd?
        @command_structure.push(Command.new(@command[i],@command[i + 1]))
      end
    end
  end

  # Return true if xy coordinates given are valid
  def valid_xy?(c)
    if (c.length == 2 && c[0].is_i? && c[1].is_i?)
      return true
    else
      return false
    end
  end

  # Return true if the text in the file is correct
  def valid_text?
    valid_command = Navigation.VALID_COMMANDS.clone
    (0..@command[0].max).each{|i| valid_command.push(i)}
    list = @command.clone
    list.flatten!
    list -= valid_command
    if list.length == 0
      return true
    else
      return false
    end
  end

  # Return true if the command objects within
  # the command_structure array are valid
  # by checking the position and movent
  def valid_commands?
    @command_structure.each do |i|
      if  i.class == Command
        if ((not valid_position?(i.position)) || (not valid_movement?(i.movement)))
          return false
        end
      end
    end
    true
  end

  # Return true if the positin in the command object is valid
  def valid_position?(p)
    c = []
    c.push(p[0])
    c.push(p[1])
    if (p.length == 3 && valid_xy?(c) && Navigation.COMPASS.include?(p.last))
      return true
    end
    false
  end

  # Return true if the movement in the command object is valid
  def valid_movement?(m)
    if m.length > 0
      m.each do |i|
        if not Navigation.DIRECTION.include?(i)
          return false
        end
      end
    else
      return false
    end
    true
  end
end
