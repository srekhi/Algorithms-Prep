def combination_sum(candidates, target)
    generate_combos(candidates, [], target, combos = [], 0)
    combos
end

def generate_combos(candidates, curr, target, combos, start)
    return combos << curr if target == 0
    return if start >= candidates.length
    candidate = candidates[start]
    generate_combos(candidates, curr + [candidate], target - candidate, combos, start) if target - candidate >= 0  # with
    generate_combos(candidates, curr, target, combos, start + 1) # without
end

=begin
lessons learned:
  - essentially, take the current guy, and evaluate all the combinations that are possible with that value
  - generate all combinations without that value
  
=end
