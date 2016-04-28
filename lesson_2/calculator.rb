require 'pry'
require 'yaml'

MESSAGES = YAML.load_file("calculator_messages.yml")

number1 ||= 0
number2 ||= 0

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(number)
  number.to_i.to_s == number
end

lang_list = <<-LIST
1)EN
2)ES
3)DE
4)IT
5)FR
6)CAT
you can choose via the name example: en
LIST

lang = ''

loop do
  prompt("This is the Calculator scrpit! choose a language:")
  puts lang_list
  lang = Kernel.gets().chomp().downcase
  if %w(en es de it fr cat).include?(lang)
    prompt(MESSAGES[lang]['welcome'])
    break
  else
    prompt("please try again")
  end
end

name = Kernel.gets().chomp()
prompt("#{name}, #{MESSAGES[lang]['say_hi']}")

loop do
  number1 = nil
  loop do
    prompt(MESSAGES[lang]['first_num'])
    prompt('please write the first number')
    check_num = Kernel.gets().chomp()
    number1 = check_num.to_f
    valid_number?(check_num) ? break : prompt('Well...That doesn\'t look as a valid number,try again')
  end

  prompt("That's the first number")

  loop do
    number2 = nil
    prompt("please write the second number")
    check_num = Kernel.gets().chomp()
    number2 = check_num.to_f
    valid_number?(check_num) ? break : prompt("well.. That doen't look as valid number, try again")
  end

  prompt("That's the second number")

  operations = <<-PARAGRAPH
  Now, wich operation you want to do:
  1) add
  2) substract
  3) multiply
  4) divide
  PARAGRAPH

  prompt(operations)

  operator = ''

  loop do
    operator = Kernel.gets().chomp().to_i
    %w(1 2 3 4).include?(operator.to_s) ? break : prompt('write a number between 1 to 4, please try again')
  end

  case operator
  when 1
    result = number1 + number2
  when 2
    result = number1 - number2
  when 3
    result = number1 * number2
  when 4
    result = number1 / number2
  end

  def operation_to_msg(operator)
    info = case operator
           when 1
             'an addition'
           when 2
             'a substraction'
           when 3
             'a multiplication'
           when 4
             'a division'
           end
    info
  end

  prompt("doing #{operation_to_msg(operator)}...")

  puts("This is the result: #{result}")
  puts "-----"
  prompt("do you want to continue operating? Y/N")
  continue = gets.chomp.downcase
  if continue == 'n'
    prompt("thanks for using the calculator, bye bye!")
    break
  elsif !(continue == 'y')
    prompt("please write 'y'(as yes) or 'n'(as no)")
  else
    next
  end
end
