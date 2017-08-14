# Given a number and a list of numbers, write a program that gives the total number of times
# the numbers in the list sum to the given number. Numbers in the list can be repeated.

def num_of_sums(num, list)
  # => divide and conquer
  helper(num, list, 0)
end

def helper(num, list, sum)
  # num of times with this function
  # num of times without
  counter = 0
  if sum == num
    return true
  elsif sum > num
    return false
  end

  list.each do |num|
    counter += 1 if helper(num, list, sum + num)
  end
end


# input: list: [1, 2, 3, 4, 5], num: 5
# output: 1 + 1 + 1
# remeber to ask for an example.
