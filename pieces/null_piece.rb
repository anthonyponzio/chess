require "singleton"
require_relative "piece"

class NullPiece < Piece
  include Singleton

  def initialize
    @color = nil
  end

  def symbol
    " "
  end

  def empty?
    true
  end

  def moves
    []
  end
end