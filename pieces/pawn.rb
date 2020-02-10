require_relative "piece"

class Pawn < Piece
  def symbol
    (color == :white) ? "♙" : "♟"
  end

  def moves
    moves = []

    row, col = pos
    side_attacks.each do |(dx, dy)|
      attack_pos = [row+dx, col+dy]
      next unless board.valid_pos?(attack_pos)
      piece = board[attack_pos]
      if !piece.empty? && piece.color != color
        moves << attack_pos
      end
    end

    forward_steps.each do |(dx, dy)|
      step_pos = [row+dx, col+dy]
      if board.valid_pos?(step_pos) && board[step_pos].empty? 
        moves << step_pos
      end
    end

    moves
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