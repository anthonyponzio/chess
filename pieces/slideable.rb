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

    new_pos = [(x + dx), (y + dy)]
    while board.valid_pos?(new_pos)
      unless board[new_pos].nil?
        unblocked_moves << new_pos if board[new_pos].color != color
        break
      end

      unblocked_moves << new_pos
      new_pos[0] += dx
      new_pos[1] += dy
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