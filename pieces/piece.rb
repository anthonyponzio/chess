class Piece
  attr_accessor :pos
  attr_reader :board, :color

  def initialize(color, board, pos)
    @color, @board, @pos = color, board, pos
  end

  def to_s
    symbol.to_s
  end

  def empty?
    false
  end

  def valid_move?(pos)
    moves.include?(pos)
  end
end
