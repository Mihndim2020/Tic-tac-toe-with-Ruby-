# !/usr/bin/env ruby

require_relative '../lib/player'
require_relative '../lib/board'

def tic_tac_toe
  player_x = Player.new('', 'X')
  player_o = Player.new('', 'O')
  board = Board.new
  introduction(board)
  player_x.name = get_player('first')
  player_o.name = get_player('second')
  puts "\nLet the game begin"
  play_game(player_x, player_o, board) 
end

def introduction(board)
  puts "Welcome to TIC-TAC-TOE game\n\n"
  puts board.display_board
  puts "\nType in your names to start the game\n"
end

def get_player(position)
  puts "\nEnter name of #{position} Player"
  player = gets.chomp
  puts "\nWelcome #{player}"
  player
end

def start_game(player_x, player_o)
  if rand(0..1).zero?
    player_o
  else
    player_x
  end
end

def play_game(player_x, player_o, board)
  turn_to_play = start_game(player_x, player_o)
  puts "\n#{turn_to_play.name} is starting the game!"
  play = true
  while play
    puts "\n #{turn_to_play.name} make a selection!"
    value = get_value(board)
    puts "\n"
    puts turn_to_play.play(board, value)
    play = check_win_or_draw(turn_to_play, board)
    turn_to_play = turn_to_play == player_x ? player_o : player_x
  end
end


