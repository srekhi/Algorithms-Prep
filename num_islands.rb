require 'byebug'
DIRECTIONS = [[0, 1], [1, 0], [0, -1], [-1, 0]]
def num_islands(grid)
    # do a BFS from 1 and have a visited 2d array which records which 1's we encounter.
    # when we reach a point where there are no more 1's to go through, we up the island counter
    debugger
    counter = 0
    #first grab all the 1s
    visited = Array.new(grid.length) { Array.new(grid.first.length) }
    grid.each_index do |row|
        grid[row].each_index do |col|
            if grid[row][col] == '1' && !visited[row][col]
                bfs(grid, row, col, visited)
                counter += 1
            end
        end
    end
    counter
end

def bfs(grid, row, col, visited)
    queue = [[row, col]]
    visited[row][col] = true
    until queue.empty?
        location = queue.shift
        visited[location.first][location.last] = true
        adjacent_positions(grid, location.first, location.last, visited).each do |pos|
            queue << pos
        end
    end
end

def adjacent_positions(grid, row, col, visited) # return [] if no adjacent 1's
    adjacent_positions = []
    DIRECTIONS.each do |delta|
        delta_x, delta_y = delta
        if grid[row + delta_x] &&
            grid[row + delta_x][col+delta_y] &&
            grid[row + delta_x][col+delta_y] == '1' &&
            !visited[row + delta_x][col + delta_y] &&
            [row + delta_x, col + delta_y].all? { |v| v >= 0 }
            adjacent_positions << [row + delta_x, col + delta_y]
        end
    end
    adjacent_positions

end

p num_islands([["1", "0", "1", "1", "0", "1", "1"]])
#expecting 3
