require_relative "piece"

class Pawn < Piece
  def symbol
    (color == :white) ? "♙" : "♟"
  end

  private
  def at_start_row?
    row,_ = pos
    (color == :black && row == 1) ||
    (color == :white && row == 6)
  end

  def forward_dir
    color == :black ? 1 : -1
  end

  def forward_steps
    standard_step = [forward_dir, 0]
    return standard_step unless at_start_row?
    [standard_step, [forward_dir * 2, 0]]
  end

  def side_attacks
    [[forward_dir, -1], [forward_dir, 1]]
  end
end