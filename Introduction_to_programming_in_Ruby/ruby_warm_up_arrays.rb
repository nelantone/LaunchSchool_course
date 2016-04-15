puts "Exersice 1"
# Below we have given you an array and a number. Write a program that checks to see if the number appears in the array.

puts "arr = [1, 3, 5, 7, 9, 11]"
arr = [1, 3, 5, 7, 9, 11]
puts "number = 3"
number = 3
number2 = 22
def item_finder(ary, item)
   if ary.include?(item)
    puts "yes! #{item} it's included"
   else
    puts "nope! #{item}, it's not included"
   end
end

item_finder(arr, number)
item_finder(arr, number2)
item_finder((1..30).to_a, 31)
item_finder((1..30).to_a, 30)
puts "-----"
puts "Exercise 2"
# What will the following programs return? What is value of arr after each?
puts "1. I'm using the product method for 2 arrays, then I select the first array result of the array product ['b',1] and I use to find the specific item I want to delete, in this case the the last from the first array,returns: arr = [['b'], ['b', 2], ['b',3], ['a', 1], ['a', 2], ['a', 3]] "
puts "2. We are creating an array inside an empty array [[1,2,3]], then we have as result ['b',[1,2,3,]] so we delete inside this array the last, [1,2,3] returns: arr = [['b'], ['a', [1,2,3]] "
puts "-----"
puts "Exercise 3"
# How do you print the word "example" from the following array?
arr = [["test", "hello", "world"],["example", "mem"]]
puts arr.last.first
puts "-----"
puts "Exercise 4"
# What does each method return in the following example?

arr = [15, 7, 18, 5, 12, 8, 5, 1]
#1. arr.index(5)
#2. arr.index[5]
#3. arr[5]
puts "1. => 3 . Index() method is finding the index unmer of the variable passed in the paramether"
puts "2. => Error... It's failing because we want to pass an arraz into a paramether and it's waiting for paranthesis instead"
puts "3. => 8 . It's 0..to 5th item giving back the item itslef"
puts "-----"
puts " Exercise 5"
# What is the value of a, b, and c in the following program?
string = "Welcome to America!"
puts a = string[6]
puts "a = e"
puts b = string[11]
puts "b = A"
puts c = string[19]
puts "c =  "
puts "-----"
puts "Exercise 6"
# You run the following code...
# names = ['bob', 'joe', 'susan', 'margaret']
# names['margaret'] = 'jody'
# ...and get the following error message:
#TypeError: no implicit conversion of String into Integer
#  from (irb):2:in `[]='
#  from (irb):2
#  from /Users/username/.rvm/rubies/ruby-2.0.0-p353/bin/irb:12:in `<main>'
#What is the problem and how can it be fixed?
puts "ruby is expecting a number of an Integer class inside the argument, to fix the error and in case we want to change the name of margaret we need to choose the 4th element and then  make it equal to the variable like this: names[3] = 'jody''"
puts "----"
puts "Exercise 7"
# Write a program that iterates over an array and builds a new array that is the result of incrementing each value in the original array by a value of 2. You should have two arrays at the end of this program, The original array and the new array you've created. Print both arrays to the screen using the p method instead of puts.
ary1 = Array(1..10)
ary2 = ary1.map {|i| i + 2 }

p ary1
p ary2
puts "-----"

