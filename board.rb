require_relative "piece"

class Board
  def initialize
    @rows = Array.new(8) do |row|
      home_row = [0, 1, 6, 7].include?(row) 
      Array.new(8) { home_row ? Piece.new : nil }
    end
  end
end