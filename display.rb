require "colorize"
require_relative "cursor"

class Display
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    @board.rows.each_with_index do |row, row_i|
      str_row = row.map.with_index do |piece, col_i|
        pos = [row_i, col_i]
        cursor_bkg = pos == (@cursor.cursor_pos) ? :magenta : nil 
        bkg = pos.sum.even? ? :light_blue : :black
        " #{piece} ".colorize(:background => cursor_bkg || bkg)
      
      end
      puts str_row.join("")
    end
  end
end
