module Stepable
  def moves
    row, col = pos
    moves = move_diffs.map { |(dx, dy)| [row + dx, col + dy] }

    moves.select do |move|
      board.valid_pos?(move) && (board[move].color != color)
    end
  end
end