class Piece
  attr_writer :pos

  def initialize(color, board, pos)
    @color, @board, @pos = color, board, pos
  end

  def to_s
    symbol.to_s
  end
end
