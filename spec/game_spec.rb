require_relative '../lib/player.rb'
require_relative '../lib/game.rb'

describe Game do
  let(:game) { Game.new('player1', 'player2', 'mark1', 'mark2') }
  lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [1, 5, 9], [3, 6, 9], [3, 5, 7]]

  it 'change player method has to show active player' do
    expect(game.change_player('player1', 'player2')).to eql('player2')
  end

  it 'win lines method has to show winline array' do
    expect(game.win_lines).to eql(lines)
  end

  it 'win check method has to show winline array' do
    expect(game.win_check).to eql(lines)
  end

#these are not working.
  # it 'create_table' do
  #   expect(game.create_table).to eql("something")
  # end

  # it 'number_get' do
  #   expect(game.number_get).to eql("something")
  # end
  # it 'update_table' do
  #   expect(game.update_table).to eql("something")
  # end
  # it 'draw' do
  #   expect(game.draw_check).to eql("something")
  # end
  # it 'play_again' do
  #   expect(game.play_again).to eql("something")
  # end
  # it 'check_input' do
  #   expect(game.check_input).to eql("something")
  # end
end
