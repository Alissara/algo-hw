# Single Element in a Sorted Array
# Given a sorted array consisting of only integers where every element
# appears twice except for one element which appears once.
# Find this single element that appears only once.
# Do it in (log n) time and O(1) space!
# 112 2 344
# 1122 3 3455

def single_in_sorted(arr)
  return arr[0] if arr.length == 1

  mid_idx = arr.length / 2
  subarr = arr[0...mid_idx].length

  if arr[mid_idx] == arr[mid_idx - 1] && subarr.odd? ||
      arr[mid_idx] == arr[mid_idx + 1] && subarr.even?
    single_in_sorted(arr[(mid_idx + 1) .. -1])
  elsif arr[mid_idx] == arr[mid_idx + 1] && subarr.odd? ||
      arr[mid_idx] == arr[mid_idx - 1] && subarr.even?
    single_in_sorted(arr[0...mid_idx])
  end
end

p single_in_sorted([1,1,2,2,3,4,4]) #== 3
p single_in_sorted([1,2,2,3,3,4,4]) #== 1
p single_in_sorted([1,1,2,3,3,4,4,5,5]) #== 2
p single_in_sorted([1,1,2,2,3,3,4,4,5]) #== 5
p single_in_sorted([1,1,2,2,3,3,4,4,5,5]) #== 3

def single_in_sorted(arr)
  lo = 0
  hi = arr.length - 1
  # stopping condition is when our window has closed
  while lo < hi
    # cutting the array in half
    mid = ((hi - lo) / 2) + lo
    # returning the item if it doesn't have a pair nearby
    return arr[mid] if arr[mid] != arr[mid-1] && arr[mid] != arr[mid+1]
    # if the index is odd and there is a pair below,
    # then the single element is above us
    # if index is even and the pair is above, same;
    # otherwise, the single element is below us
    if (arr[mid] == arr[mid-1] && mid.odd?) ||
      (arr[mid] == arr[mid+1] && mid.even?)
      lo = mid + 1
    else
      hi = mid - 1
    end
  end
  # if we haven't returned yet, then the single
  # element is at the index we closed over
  arr[lo]
end
