puts "Exercise 1"
# Write down whether the following expressions return true or false. Then type the expressions into irb to see the results."
# 1. (32 * 4) >= 129
# 2. false != !true
# 3. true == 4
# 4. false == (847 == '874')
# 5. (!true || (!(100 / 5) == 20) || ((328 / 4) == 82)) || false
puts "responses = {1: false, 2:false, 3:false, 4:true, 5:true }"
puts "5. ((false || fasle || true ) || false )=> true"
puts "----"
puts "Execise 2."
# Write a method that takes a string as argument. The method should return the all-caps version of the string, only if the string is longer than 10 characters.
#Example: change "hello world" to "HELLO WORLD". (Hint: Ruby's String class has a few methods that would be helpful. Check the Ruby Docs!)

def big_string_upcase(string)
  if string.size > 10
    string.upcase
  else
    string
  end
end

puts big_string_upcase("Hello World")
puts big_string_upcase("Hi")

puts "-----"

puts "Exercise 3"
# Write a program that takes a number from the user between 0 and 100 and reports back whether the number is between 0 and 50, 51 and 100, or above 100.
puts "Hi! Please select a number between 0 and 100"
number = gets.chomp.to_i

if (number >= 0) && (number<= 50)
  puts "the number you choosed '#{number}' it is between 0 and 50"
elsif (number < 51) && (number <= 100)
  puts "the number you choosed  '#{number}'it is between 51 and 100"
else
  puts "you choosed '#{number}' this number is above 100 or a negative one, please try again"
end
puts "----"

puts "Exercise 4"
#What will each block of code below print to the screen? Write your answer on a piece of paper or in a text editor and then run each block of code to see if you were correct.
#1.
'4' == 4 ? puts("TRUE") : puts("FALSE")
puts "FALSE"
#2.
x = 2
  if ((x * 3) / 2) == (4 + 4 - x - 3)
    puts "Did you get it right?"
  else
    puts "Did you?"
  end
puts "Did you get it right?"
#3.
y = 9
  x = 10
  if (x + 1) <= (y)
    puts "Alright."
  elsif (x + 1) >= (y)
   puts "Alright now!"
  elsif (y + 1) == x
    puts "ALRIGHT NOW!"
  else
    puts "Alrighty!"
  end
puts "Alright now!"
puts "-----"
puts "Exercise 5"
def evaluates_number_statement(number)
  if (number >= 0) && (number<= 50)
    puts "the number you choosed '#{number}' it is between 0 and 50"
  elsif (number < 51) && (number <= 100)
    puts "the number you choosed  '#{number}'it is between 51 and 100"
  else
    puts "you choosed '#{number}' this number is above 100 or a negative one, please try again"
  end
end


def evaluates_number_case_1(number)
  case
  when number < 0
    "please choose a positive number"
  when number <= 50
    "your number '#{number}', it's between 0 and 50"
  when number <= 100
    "your number '#{number}', it's between 51 and 100"
  else
    "your number is bigger than 100"
  end
end

def evaluates_number_case2(number)
  case number
  when 0..50
    "your number '#{number}'is between 0 and 50"
  when 50..100
    "your number '#{number}' is between 51 and 100"
  else
    if number < 0
      "please enter a positive number"
    else
      "your number is '#{number}' please enter a number smaller than 100"
    end
  end
end

puts "Hi! Please select a number between 0 and 100"
number = gets.chomp.to_i
puts "number statement"
evaluates_number_statement(number)
puts "--"
puts "number case1"
puts "Hi! Please select a number between 0 and 100"
puts evaluates_number_case_1(number)
puts "--"
puts "number case2"
puts "Hi! Please select a number between 0 and 100"
puts evaluates_number_case2(number)
puts "-----"
puts "Exercise 6"
# When you run the following code...

#  def equal_to_four(x)
#   if x == 4
#     puts "yup"
#   else
#     puts "nope"
#  end

#  equal_to_four(5)

# You get the following error message..

#test_code.rb:96: syntax error, unexpected end-of-input, expecting keyword_end

#Why do you get this error and how can you fix it?
puts "We forgot to close the if condition/statement*(it seems so, as it is indented), we just closed the method."
puts "  else"
puts "    puts \"nope\""
puts "  end #this one!"
puts "end"
