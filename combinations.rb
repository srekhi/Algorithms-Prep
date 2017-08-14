require 'byebug'
def combine(n, k)
    debugger
    combos = []
    (1..n).each do |start|
        # in which case we would wait [4] for example
        generate_combinations(n, k, combos, [start], start)
    end
    combos
end

def generate_combinations(n, k, combos, combo, start)
    return combos << combo if combo.length == k
    (start + 1..n).each do |num|
        generate_combinations(n, k, combos, combo + [num], num) # once we take this num, we only want to go bigger.so I take [1, 3] for example, and then I now start it off at 4.
    end
end

combine(3, 3)
