require_relative "piece"
require_relative "stepable"

class King < Piece
  include Stepable
end