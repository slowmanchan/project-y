def unique_string(str)
  str.each_with_index do |char, index|

  end
end

def reverse_string(str)
  result = []
  str.split('')
  str.each do |char|
    result =  str.shift(char)
  end
  return result
end

reverse_string("hello world")
