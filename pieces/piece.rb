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
  
  def inspect
    to_s
  end

  def dup(dup_board)
    self.class.new(@color, dup_board, @pos.dup)
  end
end
