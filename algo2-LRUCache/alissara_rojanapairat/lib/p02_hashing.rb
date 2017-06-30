class Fixnum
  # Fixnum#hash already implemented for you

end

class Array
  def hash
    each_with_index.inject(0) do |accum, (el, i)|
      (el.hash + i.hash) ^ accum
    end
  end
end

class String
  def hash
    chars.map(&:ord).hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    keys.sort.map(&:to_s).map(&:ord).hash
  end
end
