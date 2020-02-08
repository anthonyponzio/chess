class Piece
  attr_writer :pos

  def initialize(color, board, pos)
    @color, @board, @pos = color, board, pos
  end
end