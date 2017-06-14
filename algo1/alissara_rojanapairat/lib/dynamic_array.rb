require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    @length = 0
    @capacity = 8
    @store = StaticArray.new(@length)
  end

  # O(1)
  def [](index)
    self.check_index(index)
    store[index]
  end

  # O(1)
  def []=(index, value)
    self.check_index(index)
    store[index] = value
  end

  # O(1)
  def pop
    self.check_index(@length - 1)
    @length -= 1
    @store[@length + 1]
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    @length += 1
    self.resize! if @length > @capacity
    @store[@length] = val
  end

  # O(n): has to shift over all the elements.
  def shift
    self.check_index(@length - 1)
    @length -= 1
    num = @store[0]
    @store = @store[1..@length]
    num
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    @length += 1
    self.resize! if @length > @capacity
    idx = @length - 1
    while idx > 0
      @store[idx] = @store[idx - 1]
      idx -= 1
    end
    @store[0] = val

  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
    raise "index out of bounds" unless (0...length).cover?(index)
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    @capacity = @capacity * 2
    new_store = StaticArray.new(@length)
    idx = 0
    while idx < @length
      new_store[idx] = @store[idx]
      idx += 1
    end
    @store = new_store
  end
end
