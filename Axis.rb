class Axis
  attr_accessor :two_d

  def initialize(two_d)
    @two_d = two_d.clone
  end

  def replace_value
    @two_d.each do |x|
      x.map! do |e|
        if e.class == Rover
          "#{e.tag}".center(3)
        else
           " ".center(3)
        end
      end
    end
  end

  def put_value_back
    @two_d.each do |x|
      x.map! do |e|
        if e == " "
          e = nil
        end
      end
    end
  end

  def print_y_axis
    y = @two_d.length-1
    puts "  Y"
    @two_d.each do |x|
      print "#{y}".ljust(2)
      print "|".rjust(1)
      x.reverse.each do |i|
        print i
      end
      y -= 1
      puts
    end
  end

  def print_x_axis
    print "   "
    @two_d.max.each{|i| print "---"}
    puts "X"
  end

  def print_footer
    x = 0
    print "   "
    @two_d.each do |i|
      print "#{x}".center(3)
      x += 1
    end
    puts
  end

  def print_axis
    replace_value
    print_y_axis
    print_x_axis
    print_footer
    put_value_back
  end
end
