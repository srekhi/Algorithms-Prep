def num_of_sums(arr, k)
  return 0 if arr.empty?
  return 1 if arr.length == 1 && arr.first == k
  last = arr.pop
  num_of_sums(arr, k - last) + num_of_sums(arr, k)
  # this doesn't work because imagine that I have -10mn, 1, 2, 3
  # nothing is going to meet this value. so there isnt an obvious subproblem

end
