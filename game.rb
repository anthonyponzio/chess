require_relative "board"
require_relative "display"
require_relative "human_player"

class Game
  def initialize
    @board = Board.new
    @display = Display.new(@board)
    @players = [
      HumanPlayer.new(:white, @display),
      HumanPlayer.new(:black), @display),
    ].shuffle

    @current_player = @players.first
  end
end