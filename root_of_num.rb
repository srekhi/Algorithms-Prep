require 'byebug'
def root(num, n) # find nth root of num
  return num if n == 1
  # start at num / 2 and multiply to itself n times over.
  # if its too big, half it and continue.
  low = 1
  high = num
  bsearch(low, high, num, n)
end

def bsearch(low, high, num, n)
  return low if low >= high
  mid = (low + high) / 2.0
  power = mid
  (n-1).times { power = mid * power }
  if (num - power).abs <= 0.001
    mid
  else
    bsearch(low, mid, num, n)
  end
end

#they just calculated power twice. this reaffirms the idea -- care less about constnat time optimizations.
# more imp to get something clean and up ASAP.

p root(9, 2)

=begin
input:  x = 7, n = 3
output: 1

input:  x = 9, n = 2
output: 3
=end
