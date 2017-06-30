require_relative "heap"

class Array
  def heap_sort!

    idx = 1
    while idx < self.length
      BinaryMinHeap.heapify_up(self, idx, len = self[0..idx].length)
      idx += 1
    end

    p self

    # idx = self.length - 1
    # until idx < 0
    #     self[0], self[idx] = self[idx], self[0]
    #     BinaryMinHeap.heapify_down(self[0...idx], 0, len = self[0...idx].length)
    #   idx -= 1
    # end

    p self
  end


end
