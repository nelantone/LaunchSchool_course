require "pry"
## To see results uncomment the excercises that are ## one time.
puts "Exercise 1"
#What does the each method in the following program return after it is finished executing?

#x = [1, 2, 3, 4, 5]
#x.each do |a|
#  a + 1
#end
puts "The array itself: => [1, 2, 3, 4, 5]"

puts "-----"
puts "Exercise 2"
## Write a while loop that takes input from the user, performs an action, and only stops when the user types "STOP". Each loop can get info from the user.

#iteration = 0
#numbers = []
#x = 0
#while x != 'STOP' 
#  puts "Please write a number"
#  puts numb = gets.chomp
#  numbers << numb.to_f
#  puts "you have so far these numbers #{numbers}"
#  average  = numbers.inject {|sum, el| sum + el }.to_f / numbers.size
#  puts "The average of the #{numbers.size} different times you had choosen a number is:" 
#   puts average
#   puts "Write STOP if you want to exit, enter to continue"
#   x = gets.chomp
#end
puts "-----"
puts "Exercise 3"
## Use the each_with_index method to iterate through an array of your creation that prints each index and value of the array.

#ary = (1...23).to_a
#ary.each_with_index do |numb,indx|
#  puts "#{indx}" + "." + "#{numb}"
#end
puts "-----"
puts "Exercise 4"
# Write a method that counts down to zero using recursion

def count_down(numb)
  puts numb
  if numb > 0
    count_down(numb - 1)
  end
end

count_down(8)
count_down(-3)
