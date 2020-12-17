describe Player do
  let(:player) { Player.new('Player1', 'X') }

  it ' checks for player names' do
    expect(player.name).to eq('Player1')
  end

  it ' checks for player mark' do
    expect(player.mark).to eq('X')
  end
end
