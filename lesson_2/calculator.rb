require 'pry'

puts("Welcome to the ruby calculator!")
puts("please write the first number")
number1 = Kernel.gets().chomp().to_f
puts(number1)
puts("please write the second number")
number2 = Kernel.gets().chomp().to_f
puts(number2)
puts("Now, which operation you want to do")
puts <<PARAGRAPH
1) add
2) substract
3) multiply
4) divide
PARAGRAPH

operator = Kernel.gets().chomp().to_i
case operator
when 1
  result = number1 + number2
when 2
  result = number1 - number2
when 3
  result = number1 * number2
when 4
  result = number1 / number2
else
  puts "please write a number between 1 to 4, please try again"
end
puts(result)
