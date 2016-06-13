require 'pry'
# K = 10
# Q = 10
# J = 10
# A = (1..11)
CONTSTANT_NUMB = ['2', '3', '4', '5', '6', '7', '8', '9',
                  '10', 'Q', 'J', 'K', 'A'].freeze
TYPES = ['D', 'C', 'S', 'H'].freeze
# hearts, diamonds, clubs, and spades

# deck.count == 51
def clear_screen
  system('clear') || system('cls')
end

deck = []
TYPES.map { |type| CONTSTANT_NUMB.map { |num| deck << [type, num] } }
DECK = deck.freeze
puts DECK.count

def total(cards)
  values = cards.map { |card| card[1] }

  sum = 0

  # rubocop:disable Style/ConditionalAssignment
  values.each do |value|
    if value == 'A'
      sum += 11
    elsif value.to_i == 0
      sum += 10 # J, Q, K
    else
      sum += value.to_i
    end
  end
  # rubocop:enable Style/ConditionalAssignment

  values.select { |value| value == 'A' }.count.times do ## ?
    sum -= 10 if sum > 21 # ?
  end

  sum
end

def compare_result(total_player, total_computer)
  puts "In total: You have #{total_player} and computer #{total_computer}"
end

def check_result(total_player, total_computer)
  compare_result(total_player, total_computer)
  if total_player > total_computer
    puts 'player wins!'
    play_again?
  elsif total_player < total_computer
    puts 'computer wins!'
    play_again?
  else
    puts 'Tie or computer hits'
  end
end

def play_again?
  puts 'End of the game! do you want to play again? Y/N'
  answer = gets.chomp
  if answer.casecmp == 'y'
    start_game
    clear_screen
  else
    # ?
    puts 'you choose to stay!'
  end
end

def busted?(total_player, total_computer)
  if total_player >= 21
    puts 'Busted! You lose :(.'
    compare_result(total_player, total_computer)
    play_again?
  elsif total_computer >= 21
    puts 'Computer Busted! You won :)!'
    compare_result(total_player, total_computer)
    play_again?
  end
end

def hit_and_give_new_card(card)
  card << DECK.sample
  total(card)
end

def check_computer_cards(computer_values)
  puts "computer cards are #{computer_values}"
end

def check_cards(player_values, computer_values)
  puts "your cards are #{player_values}"
  puts "In total you have #{total(player_values)} points"
  puts '------'
  puts "computer card to show is #{computer_values.first}"
end

# rubocop:disable Metrics/AbcSize, Metrics/MethodLength
def start_game
  puts 'Welcome to the 21 Cards Game, please press enter
         to continue and see your cards and the computer card'
  loop do
    computer_values = [DECK.sample, DECK.sample]
    player_values = [DECK.sample, DECK.sample]
    total_player = total(player_values)
    check_cards(player_values, computer_values)
    total_computer = total(computer_values)
    loop do
      puts 'hit or stay?'
      answer = gets.chomp
      break if answer == 'stay' || busted?(total_player, total_computer)
      clear_screen
      total_player = hit_and_give_new_card(player_values)
      total_computer = hit_and_give_new_card(computer_values)
      check_cards(player_values, computer_values)
      break if answer == 'stay' || busted?(total_player, total_computer)
      check_cards(player_values, computer_values)
      check_result(total_player, total_computer)
    end
    check_computer_cards(computer_values)
    check_result(total_player, total_computer)
  end
end
# rubocop:enable Metrics/AbcSize, Metrics/MethodLength

start_game

# Despues de ver mi carta ver que hago si 'stay' ver resultado
# Hit dar una carta mas y sumar. Comparar de nuevo
