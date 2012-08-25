require_relative 'spec_helper'


describe String do
  describe "#is_i" do
    it "Check to see if string is an Integer" do
      "1".is_i?.should eql true
    end
  end

  describe "#is_s?" do
    it "Check to see if string is string" do
      "M".is_s?.should eql true
    end
  end
end

describe Fixnum do
  describe "#is_i?" do
    it "Check to see if integer is integer" do
      1.is_i?.should eql true
    end
  end
end

describe Array do
  describe "#s_to_i" do
    it "Change the contents of the array with integers and/or strings
        and converts the integers to integers" do
      ["1","S"].s_to_i.should eql [1,"S"]
    end
  end

  describe "#add_value" do
    it "\"Add value at index \'num\' by \'some other num\'" do
      [1,2,3].add_value(1,2).should eql [1,4,3]
    end
  end

  describe "#subtract_value" do
    it "\"Subtract value at index \'num\' by \'some other num\'" do
      [1,2,3].subtract_value(1,2).should eql [1,0,3]
    end
  end

  describe "#shift_right" do
    it "Move elements of the array to the right
        by removing the last element and
        putting it at the beginning" do
      [1,2,3].shift_right.should eql [3,1,2]
    end
  end

  describe "#shift_left" do
    it "Move elements of the array to the left
        by removing the first element and
        putting it at the end" do
      [1,2,3].shift_left.should eql [2,3,1]
    end
  end
end
