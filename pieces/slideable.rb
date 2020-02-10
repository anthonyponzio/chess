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
    unblocked_moves = []
    row, col = pos

    new_pos = [(row + dx), (col + dy)]
    while board.valid_pos?(new_pos)
      piece = board[new_pos]
      if piece.empty?
        unblocked_moves << new_pos
        row, col = new_pos
        new_pos = [row+dx, col+dy]
        next
      end

      unblocked_moves << new_pos if piece.color != color
      break
    end

    unblocked_moves
  end

  def moves
    moves = []

    move_dirs.each do |(dx, dy)|
      p unblocked_moves = grow_unblocked_moves_in_dir(dx, dy)
      moves.concat(unblocked_moves)
    end

    moves
  end
end