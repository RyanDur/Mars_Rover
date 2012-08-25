require_relative 'Rover_Controller'
require_relative 'Command_File'

class Mars_Rover

  attr_accessor :file
  attr_reader :f, :rc

  # Returns a new Mars_Rover object
  def initialize(file)
    @file = file
  end

  # If file is nil
  # Prompt user for a file
  # set file
  def file_nil
    if @file.nil?
      puts "Please enter a file with a \".txt\" suffx: "
      @file = gets.chomp
    end
  end

  # Create new Command_File object
  # Checks if the file is nil
  # Check if the file ends in the correct suffix
  # Throw an error if file extension is wrong
  # Check if the file exists
  # Throw an error if the file doesn't exist
  def check
    file_nil
    if @file.end_with?(".txt")
      if File.exist?(@file)
        @f = Command_File.new(@file)
      else
        raise "File \"#{@file}\" does not Exist
               Please choose a \".txt\" file that exists"
      end
    else
      raise "Invalid Input File \"#{@file}\"
             File must end in \".txt\""
    end
  end

  # Check if it has the valid command Structure
  # Throw an error if an invalid commnd structure is given
  # Creates a new Rover_Contoller
  # Tell the Rover_Controoer to explore
  # Report position of Rovers
  def start
    if @f.valid_command_structure?
      @rc = Rover_Controller.new(@f.command_structure)
      @rc.explore
      @rc.rover_controller_report
    else
      raise "Invalid Command Text
             Please Revise The Commands in \"#{@file}\""
    end
  end
end
