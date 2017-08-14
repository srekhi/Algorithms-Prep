def concat_word(s1, s2)
=begin
  - find index of s1[0]
  - solve the thing with the right asymptotic time complexity, then
  - optimize for constant factor
=end
  first_s1 = s1[0]
  # check s1
  i1 = s1.index(s2[0])
  len_1 = s1.length - i1

  i2 = s2.index(s1[0])
  len_2 = s2.length - i2

  if s1[i1...s1.length] == s2[0...len1]
    s1 + s2[len_1..-1]
  elsif  s2[i2...s2.length] == s1[0...len1]
    s2 + s1[len_2..-1]
  else
    s2 + s1
  end

end
