def count_eval(expr, bool)
  # an opening paren can precede a marker or number
  # a closing paren can only be preceded by a number

  (0...expr.length).each do |i|
    expr[i].unshift("(")
    (i + 2...expr.length).each do |j|
      if expr[j] + 1 == ""
    end
  end
end
