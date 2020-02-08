require_relative "piece"

class Board
  def initialize
    @rows = Array.new(8) do |row|
      next Array.new(8) if row > 1 && row < 6
      Array.new(8) { |col| Piece.new([row, col]) }
    end
  end
end