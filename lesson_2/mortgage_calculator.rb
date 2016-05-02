def prompt(text)
  Kernel.puts("=> #{text}")
end

def check_floats(number)
  loop do
    unless number.to_f >= 0.0 || number.to_i >= 0
      prompt('please type a positive number, zero is not a valid number')
      number = Kernel.gets().chomp().to_f
      check_floats(number)
    end
    break
  end
end

def clear_screen
  system('clear') || system('cls')
end

loop do
  Kernel.puts('======================================')
  Kernel.puts('Welcome to the Mortgage Calculator')
  Kernel.puts('---------------------------------------')
  Kernel.puts()

  prompt('Write your Loan amount')
  loan = Kernel.gets().chomp().to_f
  check_floats(loan)

  prompt('Write your Annual Percentage Rate (APR) for example 5% is 5')
  apr = Kernel.gets().chomp().to_f
  check_floats(apr)

  prompt('Write your loan duration *years')
  years = Kernel.gets().chomp().to_f
  check_floats(years)

  monthly_interest = (apr / 100) / 12
  months = years * 12
  clear_screen
  prompt("your Loan is #{loan}, your monthly rate is #{format('%0.4f', monthly_interest)} (#{apr} / 100) / 12 )")
  prompt("and your loan duration in months is #{months} (#{years} years * 12) ")

  monthly_payment = loan * (monthly_interest * (1 + monthly_interest)**months) / ((1 + monthly_interest)**months - 1)

  prompt(' As we have all variables, now we can calculate our Loan duration in months:')
  puts
  Kernel.puts("monthly payment = #{loan} [#{format('%02.4f', monthly_interest)} (1 + #{format('%02.4f', monthly_interest)}]**#{months} /")
  Kernel.puts("                  [(1 + #{format('%02.4f', monthly_interest)})**#{months} - 1]")
  puts
  prompt("With a  monthly rate #{format('%02.4f', monthly_interest)}")
  prompt('Your monthly payment in every of the #{months} months is:')
  prompt(format('%02.2f', monthly_payment))
  prompt('Another calculation? (y/n)')
  answer = Kernel.gets().chomp().upcase
  clear_screen
  unless answer.upcase().start_with?('Y', 'N')
    prompt('Please wrtie \'y\' for yes or \'n\' for no')
  end

  break if answer.upcase().start_with?('N')
end

prompt('Thanks for using the Mortgage Calculator, bye bye')
