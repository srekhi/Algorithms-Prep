def combine_strings(str1, str2)
  index = str1.rindex(str2[0])
  return str1 + str2 if index.nil?

  candidate_len = str1.length - 1 - index
  if str1[index..-1] == str2[0..candidate_len]
    str1 + str2[candidate_len + 1..-1]
  else
    str1 + str2
  end
end

p combine_strings("lucas", "casket")
p combine_strings("lucas", "cqq")
