require_relative "piece"
require_relative "stepable"

class Knight < Piece
  include Stepable


  def symbol
    (color == :white) ? "♘" : "♞"
  end
end