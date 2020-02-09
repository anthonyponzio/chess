require_relative "piece"
require_relative "stepable"

class King < Piece
  include Stepable

  def symbol
    (color == :white) ? "♔" : "♚"
  end

  def move_diffs
    [
      [-1, 0],  # up
      [1, 0],   # down
      [0, -1],  # left
      [0, 1],   # right 
      [-1, -1], # up-left
      [-1, 1],  # up-right
      [1, -1],  # down-left
      [1, 1],   # down-right
    ]
  end
end