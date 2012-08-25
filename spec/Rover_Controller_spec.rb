require_relative 'spec_helper'

describe Rover_Controller do
  before :each do
    command = Command.new([1,2,"N"],["L","M","L","M","L","M","L","M","M"])
    command2 = Command.new([3,3,"E"],["M","M","R","M","M","R","M","R","R","M"])
    @Rover_Controller = Rover_Controller.new([[5,5],command,command2])
  end

  describe "#new" do
    it "Returns a new instance of a Rover_Controller object" do
      @Rover_Controller.should be_an_instance_of Rover_Controller
    end

    it "It takes the first element of the command_structure array
        and creates a new two dimensional array" do
      array = Array.new(6).map!{Array.new(6)}
      @Rover_Controller.map =~ array
    end

    describe "#create_rover" do
      it "Create the rovers based on the number of command objects given" do
        @Rover_Controller.rover_bay.should_not be_empty
      end
    end

    describe "#initial_placement" do
      it "Place the rovers based on the coordinates
          provided by the command object" do
        rover = @Rover_Controller.rover_bay[0]
        rover == @Rover_Controller.map[1,2]
      end

      describe "#pass_initial_placement_check" do
        it "Return true if not placing one rover atop another" do
          @Rover_Controller.pass_initial_placement_check?(@Rover_Controller.rover_bay[0]).should eql true
        end

        it "Throw error if there is a collision in placement" do
          rover = Rover.new(["L","M","L","M","L","M","L","M","M"],[1,2,"N"],3)
          expect {@Rover_Controller.pass_initial_placement_check?(rover)}.to raise_exception
        end

        describe "#pass_collision_check" do
          it "Return true if there is no collision" do
            rover = @Rover_Controller.rover_bay[0]
            @Rover_Controller.pass_collision_check?(rover.coordinate,rover).should eql true
          end
        end
      end
    end
  end

  describe "#explore" do
    it "Each rover moves its full path one at a time" do
      @Rover_Controller.explore
      rover = @Rover_Controller.rover_bay[0]
      @Rover_Controller.map[1,3] == rover
    end

    describe "#pass_path_check?" do
      it "Check to see if the path is valid" do
        rover = @Rover_Controller.rover_bay[0]
        @Rover_Controller.pass_path_check?(rover).should eql true
      end

      it "Raise an error if path is not within the boundary or
          if there is a collision along the path" do
        rover = Rover.new(["L","M","L","M","L","M","L","M","M"],[-1,2,"N"],3)
        expect {@Rover_Controller.pass_path_check?(rover).should eql false}.to raise_exception
        end

      describe "#pass_boundary_check?" do
        it "Return true if the coordinate is within the prescribed boundary" do
          @Rover_Controller.pass_boundary_check?([1,1]).should eql true
        end
      end
    end
    describe "#move" do
      it "Move a rover based on the command list given from the file
          by removing it from the map and placing it in its new spot" do
        rover = @Rover_Controller.rover_bay[0]
        @Rover_Controller.move(rover)
        @Rover_Controller.map[1,3] == rover
      end

      describe "#remove_rover" do
        it "Remove the rover from the map coordinate it inhabits" do
          rover = @Rover_Controller.rover_bay[0]
          @Rover_Controller.remove_rover(rover)
          @Rover_Controller.map[rover.coordinate[0],rover.coordinate[1]].should eql nil
        end
      end

      describe "#place_rover" do
        it "Place the rover in its new coordinates" do
          rover = @Rover_Controller.rover_bay[0]
          @Rover_Controller.place_rover(rover)
          @Rover_Controller.map[rover.coordinate[0],rover.coordinate[1]].should eql rover
        end
      end
    end
  end

  describe "#rover_controller_report" do
    it "Tell the two rovers to print themselves" do
      rover = double("Rover")
      rover.should_receive(:print_rover).exactly(2)
    end
  end
end
