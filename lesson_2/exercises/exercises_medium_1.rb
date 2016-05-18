require 'pry'

### Medium 1 ###

## 1.1
##For this exercise, write a one-line program that creates the following output 10 times, with the subsequent line indented 1 space to the right:

## The Flintstones Rock!
##  The Flintstones Rock!
##   The Flintstones Rock!
## R=
10.times { |i| i.times { print ' '} and puts "The Flintstones Rock!"}
## Another way
10.times {|number| puts (" " * number) + "The Flintstones Rock!"}

## 1.2
##Create a hash that expresses the frequency with which each letter occurs in this string:

statement = "The Flintstones Rock"
##ex:
##{ "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }
## R =
stat_to_a = statement.gsub(' ','').split('')
i_hash_counter = {}
stat_to_a.each {|i| i_hash_counter[i] = stat_to_a.count(i) }
puts i_hash_counter

## another way(this time my version is shorter):
result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end

##1.3
##The result of the following statement will be an error:

#puts "the value of 40 + 2 is " + (40 + 2)
##Why is this and what are two possible ways to fix this?
## R=  (40+2) is an Integer we need to convert it into a String( is being concatenated to a string)
puts "the value of 40 + 2 is #{40+2}"
##or
puts "the value of 40 + 2 is" + (40+2).to_s

##1.4
##What would be output by this code?
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

## R= 1, 3 -> [3, 4]
## process iteration.
## 1. numbers = [1,2,3,4]
## output: number = 1, numbers.shift(1) = [1,3,4] # it deletes the item index 1 '2' 
## 2. numbers = [1,3,4]
## output: number = 3, numbers.shift(1) = [1,4] # it deletes the item index 1 '3'
## 3. numbers = [1,4]
## number = 4, numbers.shift(1) = [1]

## And this code?
numbers.each do |number|
  p number
  numbers.pop(1)
end

## R= 1, 2 -> [1,2] 
## numbers = [1,2]


##1.5
## Alan wrote the following method, which was intended to show all of the factors of the input number:

#def factors(number)
#  dividend = number
#  divisors = []
#  begin
#    divisors << number / dividend if number % dividend == 0
#    dividend -= 1
#  end until dividend == 0
#  divisors
#end

## Fix the case when number=0 ornegative,How can you change the loop construct (instead of using begin/end/until) to make this work?

def factor(number)
  if number <= 0
    puts "please write a number,needs to be positive and different than zero"  
  else
    dividend = number
    divisors = []
    until dividend == 0
      divisors << number / dividend if number % dividend == 0
      dividend -= 1
    end
    divisors
  end 
end

## or
# while dividend > 0 do
#   divisors << number / dividend if number % dividend == 0
#   dividend -= 1
# end 

puts '---'
puts factor(10)
puts '---'
p factor(0)
puts '---'
##Bonus 1
##What is the purpose of the number % dividend == 0 ?
# R= the prupose of the modulor is to check with number is divible without residual decimals. "finding the factors". Allows to determine if the result of the division is an integer number(no remainder).

##Bonus 2
##What is the purpose of the second-to-last line in the method (the divisors before the method's end)?
## the prupose of the divisors  between the 'end' is to invoke the array result when we call the factor(number).
## This is is what is the actual return value from the method. Recall that without an explicit return statement in the code, the return value of the method is the last statement executed. If we omited this line, the code would execute, but the return value of the method would be nil.


## 1.6
## Is there a difference between '<<' & '+', other than what operator she chose to use to add an element to the buffer?
def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size >= max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size >= max_buffer_size
  buffer
end

## '<<' mutates the buffer array adding a new item/items
## 'input_array + [new_element]' it just imput the result but it doesn't modifies(mutates) the buffer.

## While both methods have the same return value, in the first implementation, the input argument called buffer will be modified and will end up being changed after rolling_buffer1 returns. That is, the caller will have the input array that they pass in be different once the call returns. In the other implementation, rolling_buffer2 will not alter the caller's input argument.

## 1.7
## What's wrong with the code?
## How do you fix this so it works.

#limit = 15

#def fib(first_num, second_num)
#  while second_num < limit
#    sum = first_num + second_num
#    first_num = second_num
#    second_num = sum
#  end
#  sum
#end

#result = fib(0, 1)
#puts "result is #{result}"

## R=  we open the instance variable outside the method, the scope of the method can't reach it.
##  We need to open the limit variable inside the method in order to reach it.
## R2= Ben defines limit before he calls fib. But limit is not visible in the scope of fib because fib is a method and does not have access to any local variables outside of its scope.
## You can make limit an additional argument to the definition of the fib method and pass it in when you call fib. 

#def fib(first_num, second_num)
#  limit = 15
#  while second_num < limit
#    sum = first_num + second_num
#    first_num = second_num
#    second_num = sum
#  end
#  sum
#end

#result = fib(0, 1)
#puts "result is #{result}"

## 1.8
## titleize! This method in Ruby on Rails creates a string that has each word capitalized as it would be in a title.
##Write your own version of the rails titleize implementation.

def titelize!(words_str)
  words_str.split.each { |word| word.capitalize! }.join(' ')
end
## Or
def titelize!(words_str)
  words_str.split.map { |word| word.capitalize }.join(' ')
end

## !!: Each doesn't mutate the result(change the variable) this is why we need to .capitalize! in order to have the result .

## 1.9
## Given the munsters hash below

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

##Modify the hash such that each member of the Munster family has an additional "age_group" key that has one of three values describing the age group the family member is in (kid, adult, or senior). Your solution should produce the hash below

## { "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
##   "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
##   "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
##   "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
##   "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }

## * Kid is from 0 to 17.
## * Adult from 18 to 64
## * Senior 65+

#munsters.map do |family_members|
#  age_key = family_members.last['age']
#  if age_key <= 18
#    family_members.last['age_group'] = 'kid'
#  elsif age_key <= 64
#    family_members.last['age_group'] = 'adult'
#  else
#    family_members.last['age_group'] = 'senior'
#  end
#end

## hint: try using a case statement along with Ruby Range objects in your solution

munsters.each do |name, info_person|
  case info_person['age']
  when 0..17
    info_person['age_group'] = 'kid'
  when 18..64
    info_person['age_group'] = 'adult'
  else
    info_person['age_group'] = 'senior'
  end
end
