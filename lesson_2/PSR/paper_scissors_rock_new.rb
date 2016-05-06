require 'pry'

@game_track = 0
@user_wins = 0
@computer_wins = 0

Kernel.puts('=== Welcome to the Paper Scrissors Rock Game ===')
Kernel.puts()

VALID_CHOICES = { 'r' => 'rock', 'p' => 'paper', 's' => 'scissors', 'l' => 'lizard', 'k' => 'spock' }.freeze

def clear_screen
  system('clear') || system('cls')
end

def win_rock(player1, player2)
  player1 == 'rock' && player2 == 'scissors' || player1 == 'rock' && player2 == 'lizard'
end

def win_paper(player1, player2)
  player1 == 'paper' && player2 == 'rock' || player1 == 'paper' && player2 == 'spock'
end

def win_scissors(player1, player2)
  player1 == 'scissors' && player2 == 'paper' || player1 == 'scissors' && player2 == 'lizard'
end

def win_lizard(player1, player2)
  player1 == 'lizard' && player2 == 'paper' || player1 == 'lizard' && player2 == 'spock'
end

def win_spock(player1, player2)
  player1 == 'spock' && player2 == 'rock' || player1 == 'spock' && player2 == 'scissors'
end

def win?(player1, player2)
  win_rock(player1, player2) || win_paper(player1, player2) || win_scissors(player1, player2) || win_lizard(player1, player2) || win_spock(player1, player2)
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_choice(choice, computer)
  loop do
    choice = Kernel.gets().chomp()
    if VALID_CHOICES.values.include?(choice)
      prompt("User choose: #{choice}, computer: #{computer}")
      break
    elsif VALID_CHOICES.keys.include?(choice)
      prompt("User choose: #{VALID_CHOICES[choice]}, computer: #{computer}")
      choice = VALID_CHOICES[choice]
      break
    else
      prompt('please choose a valid answer')
    end
  end
  choice
end

def play(choice, computer)
  if win?(choice, computer)
    prompt('User win! <=')
    @user_wins += 1
  elsif win?(computer, choice)
    prompt('Computer win! <=')
    @computer_wins += 1
  else
    prompt('Tie! <=')
  end
  @game_track += 1
end

def play_again_validator(continue_or_not)
  prompt('Continue playing? y/yes or n/not')
  loop do
    continue_or_not = Kernel.gets().chomp().downcase()
    break if continue_or_not == 'y' || continue_or_not == 'n'
    prompt('please type \'y\'(for yes) or \'n\'(for no)')
  end
  continue_or_not
end

def restart_final_game
  if @user_wins == 5 || @computer_wins == 5
    @user_wins = 0
    @computer_wins = 0
    @game_track = 0
  end
end

def game_winner
  if @user_wins == 5
    prompt("Congratulations you are the final winner!")
  elsif @computer_wins == 5
    prompt("Ho soryy! The computer is the final winner!")
  else
    prompt("The final winner needs to win 5 times!")
  end
  restart_final_game
end

def counter_text
  unless @user_wins == 5 || @computer_wins == 5
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
  prompt("In #{@game_track} games: You won #{@user_wins} times and computer #{@computer_wins}.")
  counter_text
  game_winner
end

loop do
  prompt('Choose one of these options:')
  VALID_CHOICES.each { |k, v| Kernel.puts("#{k} or #{v}") }
  computer = VALID_CHOICES.values.sample
  choice = valid_choice(choice, computer)
  puts
  play(choice, computer)
  puts
  counter
  puts
  continue_or_not = play_again_validator(continue_or_not)
  if continue_or_not == 'n'
    prompt('OK, Bye bye!')
    break
  end
  clear_screen
end
