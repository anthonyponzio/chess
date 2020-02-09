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
end