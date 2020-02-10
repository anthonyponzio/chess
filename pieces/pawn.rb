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

  def forward_steps
    row, col = pos
    moves = [[row + forward_dir, col]]
    moves << [row + (forward_dir * 2), col] if at_start_row?
    moves
  end
end