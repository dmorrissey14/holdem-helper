require_relative 'holdem_helper'
require_relative 'card'
require_relative 'hand_matrix'
require 'byebug'

puts 'How many players in the game? (2-9)'

number_of_players = gets.to_i
starting_position = 9 - number_of_players

puts 'You will now be prompted for a 5 character string.'
puts 'First character is your number of seats away from the big blind'
puts "Then, enter rank and suit of both of your cards (ex: asqh = ace space queen heart) \n\n"

matrix = HoldemHelper::HandMatrix.new
length = HoldemHelper.positions.length
valid_positions = HoldemHelper.positions.slice(starting_position, length)

loop do
  puts 'Enter 5 character string: '
  user_text = gets.chomp

  break if user_text.casecmp?('quit')
  next unless user_text.length == 5

  input = user_text.split('')
  seats_away = input[0].to_i
  rank1 = HoldemHelper.rank_input[input[1]]
  suit1 = HoldemHelper.suit_input[input[2]]
  rank2 = HoldemHelper.rank_input[input[3]]
  suit2 = HoldemHelper.suit_input[input[4]]

  next unless (0..number_of_players).include?(seats_away)
  next unless HoldemHelper.ranks.include?(rank1)
  next unless HoldemHelper.ranks.include?(rank2)
  next unless HoldemHelper.suits.include?(suit1)
  next unless HoldemHelper.suits.include?(suit2)

  position = valid_positions[seats_away]
  card1 = HoldemHelper::Card.new(rank: rank1, suit: suit1)
  card2 = HoldemHelper::Card.new(rank: rank2, suit: suit2)

  if matrix.playable_hand?(position, card1, card2)
    puts 'Playable hand!'
  else
    puts 'You should fold.'
  end
end
