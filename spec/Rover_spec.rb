require_relative 'spec_helper'

describe Rover do
  before :each do
    @Rover = Rover.new(["L","M","L","M","L","M","L","M","M"],[1,2,"N"],1)
  end

  describe "#new" do
    it "Return a new Rover object" do
      @Rover.should be_an_instance_of Rover
    end

    it "Throws an ArgumentError if wrong number of arguments" do
      expect {Rover.new()}.to raise_exception
    end
  end

  describe "#move" do
    it "Logs the place the rover was in and
        Return new coordinates based on instruction" do
      @Rover.move("M")
      @Rover.path_log.should eql [[1,2,"N"]]
      @Rover.coordinate.should eql [1,3,"N"]
    end
  end

  describe "#home_coordinate" do
    it "Returns the coordinates of where the rover started" do
      @Rover.home_coordinate.should eql [1,2,"N"]
    end
  end

  describe "#tag" do
    it "Return the tag number of the rover" do
      @Rover.tag.should eql 1
    end
  end

  describe "#command" do
    it "Return the list of instructions for the rover" do
      @Rover.command.should eql ["L","M","L","M","L","M","L","M","M"]
    end
  end

  describe "#name" do
    it "Returns the name of the rover" do
      @Rover.name.should eql "Rover 1"
    end
  end

  describe "#coordinate" do
    it "Returns the coordinates of rover" do
      @Rover.coordinate.should eql [1,2,"N"]
    end
  end

  describe "#coordinate=" do
    it "Sets the coordinate of the rover" do
      rover = Rover.new(["L","M","L","M","L","M","L","M","M"],[1,2,"N"],1)
      rover.coordinate= [1,3,"N"]
      rover.coordinate.should eql [1,3,"N"]
    end
  end
end
