class Piece
  attr_accessor :pos
  attr_reader :board

  def initialize(color, board, pos)
    @color, @board, @pos = color, board, pos
  end

  def to_s
    symbol.to_s
  end
end
