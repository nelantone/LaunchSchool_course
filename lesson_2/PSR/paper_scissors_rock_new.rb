require 'pry'

@game_track = 0
@user_wins = 0
@computer_wins = 0

Kernel.puts('=== Welcome to the Paper Scrissors Rock Game ===')
Kernel.puts()

VALID_CHOICES = { 
  'r' => 'rock',
  'p' => 'paper',
  's' => 'scissors',
  'l' => 'lizard', 
  'k' => 'spock' 
}.freeze

WINNING_COMBOS = {
  'rock'     => %w(scissors lizard),
  'paper'    => %w(rock spock),
  'scissors' => %w(paper lizard),
  'lizard'   => %w(paper spock),
  'spock'    => %w(rock scissors)
}.freeze

WINS_NUMBER = 5

def clear_screen
  system('clear') || system('cls')
end

def win?(player1, player2)
  WINNING_COMBOS.key?(player1) && WINNING_COMBOS[player1].include?(player2)
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def validate_user_choice(user, computer)
  loop do
    user = Kernel.gets().chomp().downcase
    if VALID_CHOICES.values.include?(user)
      prompt("User choose: #{user}, computer: #{computer}")
      break
    elsif VALID_CHOICES.keys.include?(user)
      prompt("User choose: #{VALID_CHOICES[user]}, computer: #{computer}")
      user = VALID_CHOICES[user]
      break
    else
      prompt('please choose a valid answer')
    end
  end
  user
end

def get_game_result(user, computer)
  if win?(user, computer)
    prompt('User win! <=')
    @user_wins += 1
  elsif win?(computer, user)
    prompt('Computer win! <=')
    @computer_wins += 1
  else
    prompt('Tie! <=')
  end
  @game_track += 1
end

def validate_play_again(continue_or_not)
  prompt('Continue playing? y/yes or n/not')
  loop do
    continue_or_not = Kernel.gets().chomp().downcase()
    break if continue_or_not == 'y' || continue_or_not == 'n'
    prompt('please type \'y\'(for yes) or \'n\'(for no)')
  end
  continue_or_not
end

def restart_final_game
  if @user_wins == WINS_NUMBER || @computer_wins == WINS_NUMBER
    @user_wins = 0
    @computer_wins = 0
    @game_track = 0
  end
end

def game_winner
  if @user_wins == WINS_NUMBER
    prompt("Congratulations you are the final winner!")
  elsif @computer_wins == WINS_NUMBER
    prompt("Ho soryy! The computer is the final winner!")
  else
    prompt("The final winner needs to win #{WINS_NUMBER} times!")
  end
  restart_final_game
end

def counter_text
  unless @user_wins == WINS_NUMBER || @computer_wins == WINS_NUMBER
    if @user_wins > @computer_wins
      prompt("You are wining so far!")
    elsif @user_wins < @computer_wins
      prompt("Computer is wining you so far")
    else
      prompt("It's a tie so far")
    end
  end
end

def counter
  prompt("In #{@game_track} games: You won #{@user_wins} 
    times and computer #{@computer_wins}.")
  counter_text
  game_winner
end

loop do
  prompt('Choose one of these options:')
  VALID_CHOICES.each { |k, v| Kernel.puts("#{k} or #{v}") }
  computer = VALID_CHOICES.values.sample
  user = validate_user_choice(user, computer)
  puts
  get_game_result(user, computer)
  puts
  counter
  puts
  continue_or_not = validate_play_again(continue_or_not)
  if continue_or_not == 'n'
    prompt('OK, Bye bye!')
    break
  end
  clear_screen
end
