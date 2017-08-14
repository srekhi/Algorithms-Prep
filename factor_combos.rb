require 'byebug'
require 'Set'
def get_factors(n)
    debugger
    seen = Set.new
    factors = []
    (2...n).each do |candidate|
        if n % candidate == 0 && !seen.include?(n / candidate)
            factors << [candidate, (n/candidate)]
            factors << ([candidate] + get_factors(n/candidate))
            seen << (n/candidate)
        end
    end
    factors
end
get_factors(12)
