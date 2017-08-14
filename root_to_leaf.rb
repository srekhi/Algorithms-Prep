# @param {String} s
# @param {String[]} word_dict
# @return {Boolean}
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
