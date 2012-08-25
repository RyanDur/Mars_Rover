require_relative 'spec_helper'

describe My_Matrix do
  before :each do
    @My_Matrix = My_Matrix.new(1,1)
  end

  describe "#new" do
    it "Returns a new My_Matrix object" do
      @My_Matrix.should be_an_instance_of My_Matrix
    end

    it "Throws an ArgumentError if passed less than two arguments" do
      expect {my_matrix = My_Matrix.new(5)}.to raise_exception ArgumentError
    end

    it "Creates a two dimmensional array of nil" do
      @My_Matrix.my_matrix.length.should eql 1
      @My_Matrix.my_matrix[0].length.should eql 1
    end
  end

  describe "#[]" do
    it "Return the xy given within the two dimensional array" do
      @My_Matrix[0,0].should eql nil
    end
  end

  describe "#[]=" do
    it "Place the value at the xy given within the two dimensional array" do
      My_New_Matrix = My_Matrix.new(1,1)
      My_New_Matrix[0,0] = 1
      My_New_Matrix[0,0].should eql 1
    end
  end

  describe "#my_matrix" do
    it "Returns the two dimensinal matrix" do
      @My_Matrix.my_matrix =~ [[nil]]
    end
  end
end
