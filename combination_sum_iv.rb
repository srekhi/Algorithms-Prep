# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def combination_sum4(nums, target)
    nums.sort! # n log n
    generate_combinations(nums, target)[:counter]
end

def generate_combinations(nums, target)
    return { complete: true, counter: -1 } if target == 0
    counter = 0
    (1...nums.length).each do |num|
        break if num > target
        counter += 1 if generate_combinations(nums, target - num)[:complete]
    end
    return { complete: false, counter: counter } # if we reach this stage and target isn't zero, its false
end 
