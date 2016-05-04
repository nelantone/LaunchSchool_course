require 'pry'

Kernel.puts('=== Welcome to the Paper Scrissors Rock Game ===')
Kernel.puts()

VALID_CHOICES = %w(rock paper scissors).freeze
choice = '', computer = ''

THE_USER_WIN = (choice == 'rock' && computer == 'scissors') ||
                (choice == 'scissors' && computer == 'paper') ||
                (choice == 'paper' && computer == 'rock')

COMPUTER_WIN = (computer == 'rock' && choice == 'scissors') ||
                (computer == 'scissors' && choice == 'paper') ||
                (computer == 'paper' && choice == 'rock')

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_choice(choice)
  unless VALID_CHOICES.include?(choice)
    prompt('please choose a valid answer')
    choice = Kernel.gets().chomp()
    valid_choice(choice)
  end
end

def play(choice, computer)
  if THE_USER_WIN
    prompt('User win!')
  elsif COMPUTER_WIN
    prompt('Computer win!')
  else
    prompt('Tie!')
  end
end

def y_or_n_validator(continue_or_not)
  unless continue_or_not.casecmp == 'y' || continue_or_not.casecmp == 'n'
    prompt("please type 'y' as yes or 'n' as no")
    continue_or_not = Kernel.gets().chomp()
    y_or_n_validator(continue_or_not)
  end
end

def play_again(*)
  prompt('do you want to play again? y/n')
  continue_or_not = Kernel.gets().chomp()
  y_or_n_validator(continue_or_not)
  if continue_or_not.casecmp == 'y'
    flow
  else
    prompt('OK, Bye bye!')
  end
end

def flow
  choice = '', computer = ''
  prompt("Choose one of these options: #{VALID_CHOICES.join(', ')}")
  choice = Kernel.gets().chomp()
  computer = VALID_CHOICES.sample
  loop do
    valid_choice(choice)
    play(choice, computer)
    play_again(choice, computer)
    break
  end
end

flow
