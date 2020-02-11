require_relative "./pieces/pieces"
require_relative "display"
require_relative "human_player"

class Board
  HOME_ROW = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]

  attr_reader :rows

  def initialize(fill = true)
    @sentinel = NullPiece.instance
    @rows = Array.new(8) { Array.new(8, @sentinel) }
    fill_board if fill
  end

  def fill_board
    [0, 1, 6, 7].each do |row|
      color = (row <= 1) ? :black : :white
      home_row = (row == 0) ? HOME_ROW.reverse : HOME_ROW
      (0..7).each do |col|
        pos = [row, col]
        case row
        when 0,7 then add_piece(home_row[col].new(color, self, pos), pos)
        when 1,6 then add_piece(Pawn.new(color, self, pos), pos)
        end
      end
    end
  end

  def add_piece(piece, pos)
    self[pos] = piece
  end

  def dup
    duped_board = Board.new(false)

    @rows.flatten.each do |piece|
      next if piece.empty?
      duped_piece = piece.dup(duped_board)
      duped_board.add_piece(duped_piece, duped_piece.pos)
    end

    duped_board
  end
  
  def move_piece!(start_pos, end_pos)
    piece = self[start_pos]

    self[start_pos], self[end_pos] = @sentinel, piece
    piece.pos = end_pos
  end

  def move_piece(color, start_pos, end_pos)
    piece = self[start_pos]

    raise "no piece to move at #{start_pos}" if piece.empty?

    raise "cannot attack your own pieces" if self[end_pos].color == color

    raise "cannot move pieces that don't belong to you" if piece.color != color
    
    raise "that move would place you in check" if piece.move_into_check?(end_pos)

    raise "cannot move piece to #{end_pos}" unless piece.valid_moves.include?(end_pos)

    self[start_pos], self[end_pos] = @sentinel, piece
    piece.pos = end_pos
  end

  def []=(pos, value)
    row, col = pos
    @rows[row][col] = value 
  end

  def [](pos)
    row, col = pos
    @rows[row][col]
  end

  def valid_pos?(pos)
    pos.all? { |idx| (0..7).include?(idx) }
  end

  def find_king(color)
    @rows.flatten.find { |piece| piece.is_a?(King) && piece.color == color }
  end

  def in_check?(color)
    king = find_king(color)
    @rows.flatten.any? do |piece|
      piece.color != color && piece.moves.include?(king.pos)
    end
  end

  def checkmate?(color)
    pieces = @rows.flatten.select { |piece| piece.color == color }
    pieces.all? { |piece| piece.valid_moves.empty? }
  end
end

# Will be similar to Game class logic
board = Board.new
display = Display.new(board, true)
player = HumanPlayer.new(:white, display)

until false
  begin
    # start_pos, end_pos = player.make_move
    board.move_piece(player.color, *player.make_move)
  rescue StandardError => e
    puts e.message
    sleep(2)
  end
end


