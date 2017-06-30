# Write an in-place instance method on the Array clas that will find the kth
# smallest element in O(n) time. You will likely want to use a partition method
# similar to if not exactly the same as that which you used for QuickSort! For
# a bonus, how can we eliminate any extra space cost?
# NB: 1st smallest is the 0th element in a sorted array.

class Array

  def self.partition(array, start, length, &prc)

  end

  def select_kth_smallest(k)

  end
end

arr = [1,4,2,5,3,5]
p arr.select_kth_smallest(1)
p arr.select_kth_smallest(2)
p arr.select_kth_smallest(3)
p arr.select_kth_smallest(4)
p arr.select_kth_smallest(5)
p arr.select_kth_smallest(6)


class Array

  # This method is exactly the same.
  def self.partition(array, start, length, &prc)
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }

    # To reduce probability of pathalogically bad data set, shuffle pivot.
    new_pivot = start + rand(length)
    array[start], array[new_pivot] = array[new_pivot], array[start]

    pivot_idx = start
    pivot = array[start]

    ((start + 1)...(start + length)).each do |idx|
      if prc.call(pivot, array[idx]) > 0
        array[idx], array[pivot_idx + 1] = array[pivot_idx + 1], array[idx]
        pivot_idx += 1
      end
    end
    array[start], array[pivot_idx] = array[pivot_idx], array[start]
    pivot_idx
  end

  def select_kth_smallest(k)
    left = 0
    right = self.length - 1
    while true
      return self[left] if left == right
      pivot_idx = Array.partition(self, left, right-left+1)
      if k-1 == pivot_idx
        return self[k-1]
      elsif k-1 < pivot_idx
        right = pivot_idx - 1
      else
        left = pivot_idx + 1
      end
    end
  end
end

arr = [1,4,2,5,3,5]
p arr.select_kth_smallest(1)
p arr.select_kth_smallest(2)
p arr.select_kth_smallest(3)
p arr.select_kth_smallest(4)
p arr.select_kth_smallest(5)
p arr.select_kth_smallest(6)
