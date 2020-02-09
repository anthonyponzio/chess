require_relative "piece"
require_relative "stepable"

class Knight < Piece
  include Stepable

  def symbol
    (color == :white) ? "♘" : "♞"
  end

  def move_diffs
    [
      [-2, -1], # up-left
      [-2, 1],  # up-right
      [2, -1],  # down-left
      [2, 1],   # down-right
      [-1,-2],  # left-up
      [1, -2],  # left-down
      [-1, 2],  # right-up
      [1, 2],   # right-down
    ]
  end
end
