require 'pry'
### hard 1/1 ###

## 1.
##What do you expect to happen when the greeting variable is referenced in the last line of the code below?

if false
  greeting = “hello world”
end

greeting

## R= nothing, greeting it's true, then it will be nil.  when we initialize a local variable within an if block, even if that if block doesn’t get executed, the local variable is initialized to nil, when is outside the block

## 2.
## What is the result of the last line in the code below?

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

## R= a: 'hi there' => nil

## 3.
##What will be printed by each of these code groups?

## 3.A)

def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" #2
puts "two is: #{two}" #3
puts "three is: #{three}" #1

## R= one is one, two is two, three is three. The values don't reach the method values

## 3.B)

def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

## R= same a sbefore, we just didn't initialize first the values than the method so will ignore the values inside


## 3.C)

def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

## R= Now is different because is passing the values inside and reaching gsub! it mutates the original value.
## one is two
## two is three
## three is one

## 4.
## Each UUID consists of 32 hexadecimal characters, and is typically broken into 5 sections like this 8-4-4-4-12 and represented as a string.
## It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

 
## Write a method that returns one UUID when called with no parameters.

## R= 
## let's write a method name
def get_uuid
  ## write all the hexadecimal characters, we need to be carefull we need all integers as strings inside the array
  characters = []
  (0..9).to_a.each {|character| characters << character.to_s }
  ('a'..'f').to_a.each {|character| characters << character }
  ## write all the 5 sections in one Array
  sections = [8, 4, 4, 4, 12]
  ## we open the empty string that we are going to use.
  uuid = ''
  ## now we want to pass random characters in each section and we need to add in every section a '-' between but not in the last one. We will figure out, porbably we will use index
  sections.each_with_index do |section, index|
  ## good! we can use the section number to create section.times a random character
    section.times { uuid += characters.sample }
    ## then we add the  '-' unless the size of index + 1 is equal to the size of the sections array.Then we avoid the last '-'
    uuid += '-' unless index + 1 >= sections.size
  end
  # now we can see the result!
  uuid
end
#let's invoke the method and see the result
get_uuid
# yay!
get_uuid

## 5.

##Ben was tasked to write a simple ruby method to determine if an input string is an IP address representing dot-separated numbers. e.g. "10.4.5.11". He is not familiar with regular expressions. Alyssa supplied Ben with a method called is_a_number? to determine if a string is a number and asked Ben to use it.

#def dot_separated_ip_address?(input_string)
#  dot_separated_words = input_string.split(".")
#  while dot_separated_words.size > 0 do
#    word = dot_separated_words.pop
#    break if !is_a_number?(word)
#  end
#  return true
#end
##Alyssa reviewed Ben's code and says "It's a good start, but you missed a few things. You're not returning a false condition, and not handling the case that there are more or fewer than 4 components to the IP address (e.g. "4.5.5" or "1.2.3.4.5" should be invalid)."

##Help Ben fix his code.

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_a_number?(word)

  end
  true
end

## Ben's original return true on the last line of the method can be shortened to just true. This is because Ruby returns the result of the last line of any method by default.

