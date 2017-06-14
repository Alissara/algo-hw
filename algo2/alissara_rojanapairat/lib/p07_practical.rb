require_relative 'p05_hash_map'

def can_string_be_palindrome?(string)

  map = HashMap.new

  string.chars.each do |char|
    map[char] = char
  end

  if string.length.even?
    return true if map.count == string.length / 2
  elsif string.length.odd?
    return true if map.count == (string.length / 2) + 1
  end
  false
end
