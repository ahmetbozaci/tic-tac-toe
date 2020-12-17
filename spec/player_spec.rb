describe Player do
  let(:player) { Player.new('name', 'mark') }

  it ' checks for player names' do
    expect(player.name).to eq('name')
  end

  it ' checks for player mark' do
    expect(player.mark).to eq('mark')
  end
end
