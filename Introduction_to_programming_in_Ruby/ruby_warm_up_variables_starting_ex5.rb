puts "Exercise 5"
#Look at the following programs...

#x = 0
#3.times do
#  x += 1
#end
#puts x

# and...

#y = 0
#3.times do
#  y += 1
#  x = y
#end
#puts x
#What does x print to the screen in each case?
puts "A) => 3 (because, we intialize the variable outside the block and then we use it inside the block )"
puts "B) => Error Undefined variable or method...  (x is only defined and initialized inside the block )"
#Do they both give errors?
puts "no, just the first"
#Are the errors different? Why?
puts "no difference"
puts "-----"
puts "Exersise 6"
# What does the following error message tell you?
# NameError: undefined local variable or method `shoes' for main:Object
#  from (irb):3
#  from /usr/local/rvm/rubies/ruby-2.0.0-rc2/bin/irb:16:in `<main>'
puts "the program try to find the  variable/method shoes, first we need to initialize it and give a value or create the method or put it inside the scope in which we want to invoke"
puts "-----"
