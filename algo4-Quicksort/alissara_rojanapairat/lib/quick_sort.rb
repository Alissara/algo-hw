class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return [] if array.empty?
    pivot = array[0]
    left = []
    right = []
    array[1..-1].each do |int|
      if int < pivot
        left << int
      else
        right << int
      end
    end
      QuickSort.sort1(left) + [pivot] + QuickSort.sort1(right)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    return [] if array.length == 0
    prc = prc || Proc.new { |a, b| a <=> b }
    start = QuickSort.partition(array, start, length, &prc)
    left = array[0...start]
    right = array[start + 1..-1]
    QuickSort.partition(left, 0, left.length, &prc) + array[start] + QuickSort.partition(right, start + 1, right.length, &prc)
  end

  def self.partition(array, start, length, &prc)
    prc = prc || Proc.new { |a, b| a <=> b }
    pivot = array[start]
    border = start
    idx = start + 1
    while idx < (start + length)
      if prc.call(array[idx], pivot) == -1
        border += 1
        array[idx], array[border] = array[border], array[idx]
      end
      idx += 1
    end
    array[start], array[border] = array[border], array[start]
    border
  end
end

p QuickSort.sort1([4, 3, 5, 2, 7, 8, 1]) == [4, 3, 5, 2, 7, 8, 1].sort
