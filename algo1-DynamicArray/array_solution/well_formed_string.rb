# A string with the characters [,],{,},(,) is said to be well-formed
# if the different type of brackets match in teh correct order.
# For example, ([]){()} is well-formed, but [(]{)} is not.
# Write a function to test whether a string is well-formed

def well_formed?(str)


end

def well_formed(str)
  left_chars = []
  lookup = { '(' => ')', '['=> ']', '{'=> '}' }

  str.chars.each do |char|
    if lookup.keys.include?(char)
      left_chars << char
    elsif left_chars.length == 0 || lookup[left_chars.pop] != char
      return false
    end
  end
  return left_chars.empty?
end
