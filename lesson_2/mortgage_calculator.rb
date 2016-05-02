def prompt(text)
  Kernel.puts("=> #{text}")
end

def valid_number?(number)
  number.to_i.to_s == number
end

def check_floats(number)
  loop do
    if valid_number?(number)
      prompt("please write a number")
      number = Kernel.gets().chomp()
    elsif number.to_f() < 0
      prompt("please write a positive number")
    else
      break
    end
  end
end

loop do
  Kernel.puts("======================================")
  Kernel.puts("Welcome to the Mortgage Calculator")
  Kernel.puts("---------------------------------------")
  Kernel.puts()

  prompt("Write your Loan amount")
  loan = Kernel.gets().chomp().to_f
  check_floats(loan)

  prompt("Write your Annual Percentage Rate (APR) for example 5% is 5")
  apr = Kernel.gets().chomp().to_f
  check_floats(apr)

  prompt("Write your loan duration *years")
  years = Kernel.gets().chomp().to_f
  check_floats(years)

  monthly_interest = (apr / 100) / 12
  months = years * 12

  prompt("your Loan is #{loan}, your monthly rate is #{format('%0.4f', monthly_interest)} (#{apr} / 100) / 12 )")
  prompt("and your loan duration in months is #{months} (#{years} years * 12) ")

  monthly_payment = loan * (monthly_interest * (1 + monthly_interest)**months) / ((1 + monthly_interest)**months - 1)

  prompt(" As we have all variables, now we can calculate our Loan duration in months:")

  Kernel.puts("monthly payment = #{loan} [#{format('%02.4f', monthly_interest)} (1 + #{format('%02.4f', monthly_interest)}]**#{months} /")
  Kernel.puts("                  [(1 + #{format('%02.4f', monthly_interest)})**#{months} - 1]")

  prompt("With a  monthly rate #{format('%02.4f', monthly_interest)}")
  prompt("Your monthly payment in every of the #{months} months is:")
  prompt("#{format('%02.2f', monthly_payment)}")
  prompt("Another calculation?")
  answer = Kernel.gets().chomp().upcase
  break unless answer.upcase().start_with?('Y')
end

prompt("Thanks for using the Mortgage Calculator, bye bye")
