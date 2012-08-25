require_relative 'spec_helper'

describe Plateau do
  before :each do
    @Plateau = Plateau.new(1,1)
  end

  describe "#new" do
    it "Returns a new Plateau object
        and adds one to the x,y" do
      @Plateau.should be_an_instance_of Plateau
    end

    it "Throws an ArgumentError if passed the wrong number of arguments" do
      expect {plateau = Plateau.new()}.to raise_exception ArgumentError
    end
  end
end
