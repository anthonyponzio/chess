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

  def move_into_check?(end_pos)
    duped_board = @board.dup
    duped_board.move_piece(@pos, end_pos)
    duped_board.in_check?(@color)
  end

  def valid_moves
    moves.reject { |pos| move_into_check?(pos) }
  end
end
