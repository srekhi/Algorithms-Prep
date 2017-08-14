require 'byebug'
require 'set'
def length_of_longest_substring(s)
    set = Set.new
    max = i = j = 0
    while j < s.length
        if set.include? s[j]
            set.delete s[i]
            i += 1
        else
            set << s[j]
            j += 1
            max = set.size if set.size > max
        end
    end
    max
end


# set instead of hash table for code cleanliness
# subtract indices instead of a temp length variable
p length_of_longest_substring("tmmzuxt")
