class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @prc = prc || Proc.new { |a, b| a <=> b }
    @store = []
  end

  def count
    store.length
  end

  def extract
    store[0], store[-1] = store[-1], store[0]
    val = store.pop
    unless store.empty?
      BinaryMinHeap.heapify_down(store, 0, len = store.length, &prc)
    end
    val
  end

  def peek
    store.first
  end

  def push(val)
    @store.push(val)
    unless @store.length == 1
      BinaryMinHeap.heapify_up(store, store.length - 1, len = store.length, &prc)
    end
  end

  public
  def self.child_indices(len, parent_index)
    result = []
    left = parent_index * 2 + 1
    right = parent_index * 2 + 2
    result << left if left < len
    result << right if right < len
    result
  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index == 0
    (child_index - 1) / 2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc = prc || Proc.new { |a, b| a <=> b }
    p_idx = parent_idx
    c_idxs = self.child_indices(len, p_idx)
    until c_idxs.all? { |c| prc.call(array[p_idx], array[c]) == -1 }
      if prc.call(array[c_idxs.min], array[c_idxs.max]) == -1
        c_idx = c_idxs.min
      else
        c_idx = c_idxs.max
      end
      array[p_idx], array[c_idx] = array[c_idx], array[p_idx]
      p_idx = c_idx
      c_idxs = self.child_indices(len, p_idx)
    end
    array
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    prc = prc || Proc.new { |a, b| a <=> b }
    c_idx = child_idx
    p_idx = self.parent_index(c_idx)
    until prc.call(array[p_idx], array[c_idx]) == -1
      array[p_idx], array[c_idx] = array[c_idx], array[p_idx]
      c_idx = p_idx
      break if c_idx == 0
      p_idx = self.parent_index(c_idx)
    end
    array
  end
end
