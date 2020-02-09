module Slideable
  HORIZONTAL_DIRS = [
    [-1, 0], # up
    [1, 0],  # down
    [0, -1], # left
    [0, 1],  # right
  ]

  DIAGONAL_DIRS = [
    [-1, -1], # up-left 
    [-1, 1],  # up-right
    [1, -1],  # down-left
    [1, 1],   # down-right
  ]

  def horizontal_dirs
    HORIZONTAL_DIRS.dup
  end

  def diagonal_dirs
    DIAGONAL_DIRS.dup
  end

  def grow_unblocked_moves_in_dir(dx, dy)
    board_bounds = (0..7)
    unblocked_moves = []
    x, y = pos

    new_x, new_y = x + dx, y + dy
    while board_bounds.include?(new_x) && board_bounds.include?(new_y)
      unblocked_moves << [new_x, new_y]
      new_x += dx
      new_y += dy
    end

    unblocked_moves
  end

  def moves
    moves = []

    move_dirs.each do |(dx, dy)|
      moves.concat(grow_unblocked_moves_in_dir(dx, dy))
    end

    moves
  end
end