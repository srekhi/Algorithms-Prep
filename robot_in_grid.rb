def get_path(maze)
  has_path = Array.new(maze.length) { Array.new(maze.first.length) }
  find_path(maze, path, maze.length - 1, maze.first.length - 1, has_path)

end

def find_path(maze, path, row, col, has_path)
  return has_path[row][col] unless has_path[row][col].nil? # if we have already visited it, bounce
  if (row == 0 && col == 0) ||
    (find_path(maze, path, row - 1, col) ||
    find_path(maze, path, row, col - 1)) ||
    has_path

    path << [row, col]
    has_path[row][col] = true
    return true
  end
  has_path[row][col] = false
  false
end
