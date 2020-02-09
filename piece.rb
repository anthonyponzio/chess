class Piece
  attr_writer :pos

  def initialize(color, board, pos)
    @color, @board, @pos = color, board, pos
  end

  def to_s
    "#{symbol}"
  end

  def symbol
    raise '#symbol needs to be implemented by subclass'
  end
end