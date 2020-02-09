require_relative "piece"
require_relative "slideable"

class Bishop < Piece
  include Slideable

  def symbol
    (color == :white) ? "♗" : "♝"
  end

  def move_dirs
    diagonal_dirs
  end
end