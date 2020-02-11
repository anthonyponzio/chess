require_relative "./pieces/pieces"
require_relative "display"

class Board
  HOME_ROW = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]

  attr_reader :rows
  def initialize
    @sentinel = NullPiece.instance
    @rows = build_board
  end

  def build_board
    Array.new(8) do |row|
      color = row <= 1 ? :black : :white
      
      case row
      when 0, 7
        home_row = (row == 0) ? HOME_ROW.reverse : HOME_ROW
        Array.new(8) { |col| home_row[col].new(color, self, [row, col]) }
      when 1, 6
        Array.new(8) { |col| Pawn.new(color, self, [row, col]) }
      else
        Array.new(8, @sentinel)
      end      
    end
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


