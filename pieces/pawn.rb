require_relative "piece"

class Pawn < Piece
  def symbol
    (color == :white) ? "♙" : "♟"
  end

  def at_start_row?
    row,_ = pos
    (color == :black && row == 1) ||
    (color == :white && row == 6)
  end

  def forward_dir
    color == :black ? 1 : -1
  end
end