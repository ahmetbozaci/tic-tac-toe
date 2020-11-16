#!/usr/bin/env ruby
require_relative '../lib/interface.rb'
require_relative '../lib/player.rb'
require_relative '../lib/logic.rb'

interface = Interface.new
interface.display
interface.players_name
player = Player.new
player.change_player
player.number
