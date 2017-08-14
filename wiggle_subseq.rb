require 'byebug'
def wiggle_max_length(nums)
    debugger
    visited = Array.new(nums.length) { Array.new(2) } # index 0 is wiggle_up, index1 is wiggle_down
    [   build_seq(nums, 0, 0, true, -1.0/0.0, visited),
        build_seq(nums, 0, 0, false, 1.0/0.0, visited)
    ].max
end

def build_seq(nums, index, len, wiggle_up, prev, visited)
    return len if index >= nums.length # doesn't belong in the memo anyway
    memo_index = wiggle_up ? 0 : 1
    return visited[index][memo_index] unless visited[index][memo_index].nil?

    max_len = 0
    if wiggle_up && nums[index] - prev > 0 || !wiggle_up && nums[index] - prev < 0
        max_len = build_seq(nums, index + 1, len + 1, !wiggle_up, nums[index], visited)
    end
    max_len = [max_len, build_seq(nums, index + 1, len, wiggle_up, prev, visited)].max
    visited[index][memo_index] = max_len
end

wiggle_max_length([1,7,4,9,2,5])
