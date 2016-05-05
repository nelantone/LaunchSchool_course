require 'pry'

Kernel.puts('=== Welcome to the Paper Scrissors Rock Game ===')
Kernel.puts()

VALID_CHOICES = %w(rock paper scissors).freeze

def win?(player1, player2)
  (player1 == 'rock' && player2 == 'scissors') ||
    (player1 == 'scissors' && player2 == 'paper') ||
    (player1 == 'paper' && player2 == 'rock')
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_choice(choice, computer)
  loop do
    if VALID_CHOICES.include?(choice)
      prompt("User choose: #{choice}, computer: #{computer}")
      break
    else
      prompt('please choose a valid answer')
      choice = Kernel.gets().chomp()
    end
  end
end

def play
  computer = VALID_CHOICES.sample
  choice = Kernel.gets().chomp()
  valid_choice(choice, computer)

  if win?(choice, computer)
    prompt('User win! <=')
  elsif win?(computer, choice)
    prompt('Computer win! <=')
  else
    prompt('Tie! <=')
  end
end

def y_or_n_validator(continue_or_not)
  unless continue_or_not.casecmp('y') || continue_or_not.casecmp('n')
    prompt('please type \'y\'(for yes) or \'n\'(for no)')
    continue_or_not = Kernel.gets().chomp().downcase()
    y_or_n_validator(continue_or_not)
  end
end

def play_again
  prompt('do you want to play again? y/yes or n/not')
  continue_or_not = Kernel.gets().chomp().downcase()
  y_or_n_validator(continue_or_not)

  if continue_or_not.casecmp('y')
    flow
  else
    prompt('OK, Bye bye!')
  end
end

def flow
  prompt("Choose one of these options: #{VALID_CHOICES.join(', ')}")
  loop do
    play
    play_again
    break
  end
end

flow
