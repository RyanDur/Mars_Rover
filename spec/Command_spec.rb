require_relative 'spec_helper'

describe Command do
  before :each do
    @Command = Command.new(["position"],["movement"])
  end

  describe "#new" do
    it "Returns a new Command object" do
      @Command.should be_an_instance_of Command
    end

    it "Throws an ArgumentError if passed less than two arguments" do
      expect {command = Command.new([])}.to raise_exception ArgumentError
    end
  end

  describe "#position" do
    it "Returns an array of the position" do
      @Command.position.should eql ["position"]
    end
  end

  describe "#movement" do
    it "Returns an array of the movement" do
      @Command.movement.should eql ["movement"]
    end
  end
end
