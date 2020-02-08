require_relative "piece"

class Board
  def initialize
    @rows = Array.new(8) do |row|
      next Array.new(8) if row > 1 && row < 6
      Array.new(8) { |col| Piece.new([row, col]) }
    end
  end
  
  def move_piece(start_pos, end_pos)
    piece, self[start_pos] = self[start_pos], nil

    raise "no piece to move at #{start_pos}" if piece.nil?

    self[end_pos] = piece
  end

  def []=(pos, value)
    row, col = pos
    @rows[row][col] = value 
  end

  def [](pos)
    row, col = pos
    @rows[row][col]
  end
end