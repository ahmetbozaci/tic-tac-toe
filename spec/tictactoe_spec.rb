require_relative '../lib/player.rb'
require_relative '../lib/game.rb'


describe Game do
  let(:game) {Game.new('player1', 'player2', 'mark1', 'mark2')}
  lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [1, 5, 9], [3, 6, 9], [3, 5, 7]]
  @number_options 
  it "change player method has to show active player" do
    expect(game.change_player('player1','player2')).to eql("player2")
  end

  it "win lines method has to show winline array" do
    expect(game.win_lines).to eql(lines)
  end

  it "win check method has to show winline array" do
    expect(game.win_check).to eql(lines)
  end
end