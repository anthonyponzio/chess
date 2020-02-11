require_relative "./pieces/pieces"
require_relative "display"

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
  
  def move_piece(start_pos, end_pos)
    piece = self[start_pos]  
    
    if piece.empty?
      raise ArgumentError.new("no piece to move at #{start_pos}") 
    end

    unless piece.valid_move?(end_pos)
      raise ArgumentError.new("cannot move piece to #{end_pos}")
    end

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
      piece.color != color && piece.valid_move?(king.pos)
    end
  end
end

# Will be similar to Game class logic
board = Board.new
display = Display.new(board, true)
cursor = display.cursor
start_pos = nil

until false
  display.render
  input = cursor.get_input
  unless input.nil?
    if start_pos
      begin
        board.move_piece(start_pos, input)
      rescue ArgumentError => e
        puts e.message
        sleep(3)
      end
      start_pos = nil
    else
      start_pos = input
    end
  end
end


