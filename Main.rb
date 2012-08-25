require_relative 'Mars_Rover'

file = ARGV[0]
#file = "Test_Input.txt"

begin
  mr = Mars_Rover.new(file)
  mr.check
  mr.start
rescue Exception => e
  puts e.inspect
end

