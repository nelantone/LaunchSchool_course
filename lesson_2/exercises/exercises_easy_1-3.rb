##1
numbers = [1, 2, 2, 3]
numbers.uniq

#puts numbers
## is printing all items in the array, => 1 2 2 3
## if we want to print the unique numbers  we need to make it:
#puts numbers.uniq
## or:
#numbers = numbers.uniq
# puts numbers 

##2
## Describe the difference between ! and ? in Ruby

## 2.1. (!=) not equal, opposite of (==) equal
## 2.2. (!) as (!user_name) not user name. Opposite as (user_name)
## 2.3. (!) as (words.uniq!) , *(!)in a method normally is telling us that can mutate the content of the item or  items.
## 2.4. (?) before something, it can be a Ternary operator (something true ? do this : else do this. We use it for making a conditional in one line (isntead if ... else... end) 
## 2.5. (?) after something, (2+2=4 ? puts 'it's true!' : 'nope learn maths' => it's true!) 
## 2.6. (!!) as (!!username) !!user_name(true) == username => true. Is a double negation, so if username is true, !username is false, and !! username is true(their boolean equivalent).

## 3
# Replace the word "important" with "urgent" in this string:
# advice = "Few things in life are as important as house training your pet dinosaur.".gsub!('important', 'urgent')

## 4 
#numbers = [1, 2, 3, 4, 5]
#numbers.delete_at(1)
#numbers.delete(1)
## The folow method calls are doing (we reset numbers between method calls)
## .delete_at:  is deleting the number who is in the index position one. in this case is '2', 0 is one, 1 is '2'.
## .delete: is deleting the number 1 inside the array and doesn't matter win which position it is. More well expressed: In the return of the value of the call the item 1 is removed.
## Important to take  a look that even the methods don't have !,  are modifying in place(mutating the 'name' value)
## 5 
## Programmatically determine if 42 lies between 10 and 100. (using range)
(10..100).include?(42)
##or
(10..100).cover?(42)
## if we give a 3 points range *(...) the sides of the range are not included.

## 6
## Starting with the string:
famous_words = 'seven years ago...'
##show two different ways to put the expected "Four score and " in front of it.
##6.1
puts 'For score and ' + famous_words
##6.2
puts "For score and #{famous_words}"
##6.3
puts 'Four score and' << famous_words
##6.4
famous_words.prepend('Four score and ')
##6.5

## 7
#def add_eight(number)
#  number + 8
#end

#number = 2

#how_deep = "number"
#5.times { how_deep.gsub!("number", "add_eight(number)") }

#p how_deep

## add_eight(add_eight(add_eight(add_eight(add_eight(number)))))
## using the Kernel.eval method
## eval(how_deep)
## (8 + (8 + (8 + (8 + (2 + 8)))) = 42


## 8
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

# this is a nested array
# to make it un-nested:

flintstones = flintstones.flatten
##or shorter
flinstones.flatten!

##9
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
## Turn this into an array containing only two elements: Barney's name and Barney's number
flintstones = [ "Barney", 2 ]
## Well technicaly, it's correct ^^,but let's mutate the hash with some methods.
flintstones = flintstones.to_a[2]
## or shorter
flintstones.assoc("Barney")

## 9
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
## Turn this array into a hash where the names are the keys and the values are the positions in the array. 
flintstones_hash = {}

flintstones.each_with_index do |name, index|
  flintstones_hash[name] = index
end
