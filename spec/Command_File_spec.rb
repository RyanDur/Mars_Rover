require_relative 'spec_helper'

describe Command_File do
  before :each do
    @Command_File = Command_File.new("Test_Input.txt")
  end

  describe "#new" do
    it "Returns a new Command_File object" do
      @Command_File.should be_an_instance_of Command_File
    end

    it "Throws an ArgumentError if passed more than one arguments" do
      expect {command_File = Command_File.new("T","T")}.to raise_exception ArgumentError
    end

    it "It fills an array with lines of text" do
      @Command_File.lines.should_not be_empty
    end

    describe "#process_command_file" do
      it "Processes the lines of text into a command structure
         by gathering the commands and creating a command structure" do
        @Command_File.command_structure.should_not be_empty
      end
      describe "#gather_command" do
        it "Gather the lines and splits them into a command array
            checking for integers and converting them" do
          @Command_File.command.should_not be_empty
        end
      end

      describe "#create_command_structre" do
        it "Takes the the first element, which is the size of the field,
            and then takes every odd index
            putiing every two commands into a command object
            and pushing them into the command_structure array" do
          @Command_File.command_structure.should_not be_empty
        end
      end
    end
  end

  describe "#valid_command_structure?" do
    it "Return true if commands within the
        command_structure array are valid
        by checking the xy coordinates, text
        within the file and the command objects" do
      @Command_File.valid_command_structure?.should == true
    end

    describe "#valid_xy?" do
      it "Return true if xy coordinates given are valid" do
        @Command_File.valid_xy?(@Command_File.command_structure[0]).should == true
      end
    end

    describe "#valid_text?" do
      it "Return true if the text in the file is correct" do
        @Command_File.valid_text?.should == true
      end
    end

    describe "#valid_commands?" do
      it "Return true if the command objects within
          the command_structure array are valid
          by checking the position and movent" do
        @Command_File.valid_commands?.should == true
      end

      describe "#valid_position?" do
        it "Return true if the positin in the command object is valid" do
          @Command_File.valid_position?([1,2,"N"])
        end
      end

      describe "#valid_movement?" do
        it "Return true if the movement in the command object is valid" do
          @Command_File.valid_movement?(["M"]).should == true
        end
      end
    end
  end
end
