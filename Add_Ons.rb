class String
  # Check to see if string is an Integer
  def is_i?
    true if Integer(self) rescue false
  end
  
  # Check to see if string is string
  def is_s?
    true if String(self) rescue false
  end
end

class Fixnum
  # Check to see if integer is integer
  def is_i?
    true if Integer(self) rescue false
  end
end

class Array
  # Change the contents of the array with integers and/or strings
  # and converts the integers to integers
  def s_to_i
    self.map{|x| x.is_i? ? x.to_i : x}
  end

  # Add value at index 'num' by 'some other num'
  def add_value(at,by)
    self.each_with_index.map{|x,i| i == at ? x + by : x}
  end

  # Subtract value at index 'num' by 'some other num'
  def subtract_value(at,by)
    self.each_with_index.map{|x,i| i == at ? x - by : x}
  end

  # Move elements of the array to the right
  # by removing the last element and
  # putting it at the beginning
  def shift_right
    self.unshift(self.pop)
  end

  # Move elements of the array to the left
  # by removing the first element and
  # putting it at the end
  def shift_left
    self.push(self.shift)
  end
end
