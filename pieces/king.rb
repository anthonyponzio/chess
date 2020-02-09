require_relative "piece"
require_relative "stepable"

class King < Piece
  include Stepable

  def symbol
    (color == :white) ? "♔" : "♚"
  end
end