puts "Exercise 1"
# Add two strings together that, when concatenated, return your first and last name as your full name in one string.
#"<Firstname> <Lastname>"

first_name = 'Antonio'
last_name = 'Serna'
puts first_name + " " + last_name
puts "----"

puts "Exercise 2"
# 
# I want to take each of the 4 digit number using the modulor and divison or a combination or both.
# number choosen is: 3275"

thousands = 3275 / 1000
# As we have Integer class values the result qill be an integer, in this case 3 the thousends digit.
hundreds = 3275 / 100 % 10
#now we have first 375 / 100 = 32
# as 32 % 10 = 2 we have hundreds digit.
tents = 3275 / 10 % 32
# We have the tents digit
ones = 3275 % 327
puts "thousands = #{thousands}" 
puts "hundreds = #{hundreds}"
puts "tents = #{tents}"
puts "ones = #{ones}"
puts "#{thousands}"+"#{hundreds}"+"#{tents}"+"#{ones}" + "=" + "3275"
puts "----"

puts "Excersise 3"
#Write a program that uses a hash to store a list of movie titles with the year they came out. 
#Then use the puts command to make your program print out the year of each movie to the screen. The output for your program should look something like this.
# 1975
# 2004
# 2013
# 2001
# 1981
movie_year = { jaws:1975,
               "Eternal Sunshine of the Spotless Mind"=> 2004,
               her:2013,
               a_Beautiful_Mind:2001,
               :chariots_of_Fire => 1981 }
puts mov_1 = movie_year[:jaws]
puts mov_2 = movie_year["Eternal Sunshine of the Spotless Mind"]
puts mov_3 = movie_year[:her]
puts mov_4 = movie_year[:a_Beautiful_Mind]
puts mov_5 = movie_year[:chariots_of_Fire]
puts "-----"

puts "Excersise 4"
#Use the dates from the previous example and store them in an array. Then make your program output the same thing as exercise 3.
mov_ary = [ mov_1, mov_2, mov_3, mov_4, mov_5]
puts mov_ary.first
puts mov_ary[1]
puts mov_ary[2]
puts mov_ary[3]
puts mov_ary.last
puts "-----"

puts "Ecercise 5"
# Write a program that outputs the factorial of the numbers 5, 6, 7, and 8
puts factorial_5 = 1 * 2 * 3 *4 * 5
puts factorial_6 = factorial_5 * 6
puts factorial_7 = factorial_6 * 7
puts factorial_8 = factorial_7 * 8
# check 
puts factorial_5 * 6 * 7 * 8 == factorial_8
puts "-----"

puts "Excercise 6"
# Write a program that calculates the squares of 3 float numbers of your choosing and outputs the result to the screen.
puts square_of_18 = 18.0 ** 2
puts 18.0 * 18.0 == 18 ** 2
puts square_of_18.class
puts 3.1416 ** 2
puts (5 * 3.1416) ** 2
puts "----"

puts "Excersise 7"
# What does the following error message tell you?
# SyntaxError: (irb):2: syntax error, unexpected ')', expecting '}'
# from /usr/local/rvm/rubies/ruby-2.0.0-rc2/bin/irb:16:in `<main>'
puts "The error, is telling us that we forgot to close properly a hash,it seems that we close the hash with a parenthesis instead of a square bracket"
puts "-----"

