def permute_unique(arr)
  hash = Hash.new { |h, k| h[k] = 0 }
  arr.each { |n| hash[n] += 1 }
  generate_permutations(arr, hash, [], perms = [])
  perms
end

def generate_permutations(arr, hash, current, perms)
  all_zeroes = true
  hash.each_pair do |k, v|
    if v > 0
      all_zeroes = false
      this_hash = hash.dup
      this_hash[k] -= 1
      generate_permutations(arr, this_hash, current + [k], perms)
    end
  end
  perms << current if all_zeroes
end

p permute_unique([1,1,2])

=begin
Lessons learned
  This is a common permutation algorithm to reduce duplicates.
  When you pass an array into a function as a parameter to mutate,
  be careful with the way you handle mutations. for example, the perms << function didn't make no sense at all.
when you are doing something like passing in a parameter to be mutated, mutate the parameter when the base case arises.
that's how you handle that type of problem. its also cleaner to mutate this way. instead of naming the variable right outside of the method call,
name it INSIDE the method invocation. significantly cleaner! finally, remember this algorithm. this is probably goign to come up at some point, to recap:
create a count hash of each character. for each character that has a vlaue of greater than 1, decremenet the count of that value and place it onto a current array
variable. when we reach the point where all characters are used up, that means we have arrived at a permutation, so put this
on the perms array.

so how does this ensure no dups? well - we keep peeling off one character and resuming building out the perm.

=end
