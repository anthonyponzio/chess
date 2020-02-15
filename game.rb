require_relative "board"
require_relative "display"
require_relative "human_player"

class Game
  def initialize
    @board = Board.new
    @display = Display.new(@board)
    @players = [
      HumanPlayer.new(:white, @display),
      HumanPlayer.new(:black, @display),
    ].shuffle

    @current_player = @players.first
  end

  def swap_turn!
    @players.rotate!
    @current_player = @players.first
  end

  def gameover?
    @board.checkmate?(:black) || @board.checkmate?(:white)
  end

  def play
    until gameover?
      begin
        @board.move_piece(@current_player.color, *@current_player.make_move)
      rescue StandardError => e
        puts e.message
        sleep(2)
        retry
      end
      swap_turn!
    end

    winner = @board.checkmate?(:black) ? "White" : "Black"
    puts "Checkmate! #{winner} wins!"
  end
end


if __FILE__ == $PROGRAM_NAME
  game = Game.new
  game.play
end