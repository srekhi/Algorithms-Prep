# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def three_sum_smaller(nums, target)
    return 0 if nums.length <= 2 #error input
    nums.sort!
    i = 0
    triplet_count = 0
    while i < nums.length
        j = i + 1
        while j < nums.length
            pair_sum = nums[i] + nums[j]
            val = target - pair_sum
            k = binary_search(nums, val, j) #if val in it, we want all indices between j and k. else all indices j and k including k.
            p k
            (nums[k] >= val) ? triplet_count += ((j + 1)...k).size : triplet_count += ((j + 1)..k).size #ensures k > j.
            j += 1 #if it's greater than or equal to val we can't use K.
        end
        i += 1
    end

    triplet_count
end

def binary_search(arr, val, j)
  b_search(arr, val, j, arr.length - 1)
end

def b_search(arr, val, j, high)
  while low < high
    mid = (low + high) / 2
    if arr[mid] > val #left half
      high = mid - 1
    elsif arr[mid] < val
      low = mid + 1
    else
      #go left until it's no longer k and return this. this is problem because if elements are equal..
      until arr[mid] != val && mid > j
        mid -= 1
      end
      return mid
    end
  end

  low
end
