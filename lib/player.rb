# require_relative 'main.rb'
class Player
  attr_reader :name, :mark
  def initialize(name, mark)
    @name = name
    @mark = mark
  end
end
