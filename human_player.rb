class HumanPlayer
  attr_reader :color

  def initialize(color, display)
    @color, @display = color, display
  end

  def make_move
    start_pos, end_pos = nil, nil
    @display.render # possibly remove initial render

    until start_pos && end_pos
      input = @display.cursor.get_input
      @display.render # possibly move to before input entry
      unless input.nil?
        unless start_pos
          start_pos = input
        else
          end_pos = input
        end
      end
    end

    [start_pos, end_pos]
  end
end