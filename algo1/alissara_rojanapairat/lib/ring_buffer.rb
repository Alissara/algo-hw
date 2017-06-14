require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    @length = 0
    @capacity = 8
    @start_idx = 0
    @store = StaticArray.new(8)
  end

  # O(1)
  def [](index)
    check_index(index)
    store[(start_idx + index) % capacity]
  end

  # O(1)
  def []=(index, val)
    check_index(index)
    store[(start_idx + index) % capacity] = val
  end

  # O(1)
  def pop
    raise "index out of bounds" if (length == 0)
    val, self[length - 1] = self[length - 1], nil
    self.length -= 1
    val
  end

  # O(1) ammortized
  def push(val)
    resize! if (length == capacity)
    self.length += 1
    self[length - 1] = val
    nil
  end

  # O(1)
  def shift
    self.check_index(@start_idx)
    @length -= 1
    @start_idx = (@start_idx + 1) % @length
    @store[@start_idx - 1]
  end

  # O(1) ammortized
  def unshift(val)
    @length += 1
    self.resize! if @length > @capacity
    @start_idx = ((@start_idx - 1) % @length)
    @store[((@start_idx - 1) % @length)] = val
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
    raise "index out of bounds" unless (0...length).cover?(index)
  end

  def resize!
    @capacity = @capacity * 2
    new_store = StaticArray.new(@capacity)
    idx = 0
    while idx < @length
      new_store[idx] = @store[idx]
      idx += 1
    end
    @store = new_store
  end
end
