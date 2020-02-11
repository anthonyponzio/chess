require "colorize"
require_relative "cursor"

class Display
  attr_reader :cursor

  def initialize(board, debugging=false)
    @board = board
    @cursor = Cursor.new([0,0], board)
    @debugging = true
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
    end

    if (@debugging)
      puts "black in check? #{@board.in_check?(:black)}"
      puts "white in check? #{@board.in_check?(:white)}"
    end
  end
end
