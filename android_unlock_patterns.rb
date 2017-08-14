# @param {Integer} m
# @param {Integer} n
# @return {Integer}
DIAGONALS = [[-1, 1], [1, 1], [1, -1], [-1, -1]]
CARDINALS = [[1, 0], [0 ,1], [0, -1], [-1, 0]]
def number_of_patterns(m, n)
    # iterate through all 9 locations, and launch a recursive pattern from each. each also needs its own visited[][] array.
    # and each recursive call coming out of it needs its own???
    # it's wasteful, but if it works then i'll think about how this could be done better.
    (0..3).each do |row|
        (0..3).each do |col|
            visited = Array.new(3) { Array.new(3) }
            count_patterns(m, n, visited, [row, col])
        end
    end
end

def count_patterns(m, n, visited, pos)
    free_diagonals = free_positions(DIAGONALS, visited)
    free_cardinals = free_positions(CARDINALS, visited)
    if free_diagonals.empty? && free_cardinals.empty? # can't go nowhere.
        return visited.length >= m ? 1 : 0
    end

    (free_cardinals + free_diagonals).each do |pos|
        this_visited = visited.dup
        this_visited[pos.first][pos.last] = true
        count_patterns(m, n, this_visited)
    end
end

def free_positions(arr, visited)
    arr.reject do |pos|
        visited[pos.first][pos.last]
    end
end 
