require 'byebug'
def word_break(s, word_dict)
    can_break?(s, word_dict, memo = {})
end

def can_break?(s, word_dict, memo)
    return true if s.empty?
    (0...s.length).each do |index|
        string_to_pass = s[index + 1...s.length]
        memo[string_to_pass] ||= can_break?(string_to_pass, word_dict, memo)
        return true if word_dict.include?(s[0..index]) && memo[string_to_pass]
    end
    false
end
word_break("leetcode", ["leet","code"])


#another split: lee, tcode
# so we want to preserve checking for whether a word exists in word_dict as well and cut that out too.


# Time complexity here:
#
