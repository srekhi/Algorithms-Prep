require 'byebug'
@longest = [0,0]
def longest_palindrome(s)
    debugger
    s.length.times do |i|
        stretchPal(s, i, i)
        stretchPal(s, i, i + 1)
    end

    indices = @longest
    @longest = s[indices[0]..indices[1]]
    @longest
end

def stretchPal(s, i, j)
    while i >= 0 && j < s.length && s[i] == s[j]
        @longest = [i, j] unless (j - i) <= (@longest[1] - @longest[0])
        i -= 1
        j += 1
    end
end

longest_palindrome("cbbd")
