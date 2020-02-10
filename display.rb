require "colorize"
require_relative "cursor"

class Display
  attr_reader :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    system("clear")
    cursor_color =  @cursor.selected ? :green : :blue
    @board.rows.each_with_index do |row, row_i|
      str_row = row.map.with_index do |piece, col_i|
        pos = [row_i, col_i]
        box_color = pos.sum.even? ? :light_red : :black
        bkg = (@cursor.cursor_pos == pos) ? cursor_color : box_color
        next " #{piece} ".colorize(:background => bkg)
      end
      puts str_row.join("")
      # puts String.color_samples
    end
  end
end
