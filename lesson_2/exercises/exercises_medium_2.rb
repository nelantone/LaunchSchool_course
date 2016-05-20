### Medium level 2 ###

## 2.1
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" }
}

##Figure out the total age of just the male members of the family.
## R=
total_male_age = 0
munsters.each { |name, person_info| total_age += person_info['age']  if  person_info['gender'] == 'male' }
puts total_male_age


## 2.2
## Given this previously seen family hash, print out the name, age and gender of each family member:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
##...like this:

##(Name) is a (age) year old (male or female).
## R=
munsters.each do |name, person_info|
  puts "#{name} is #{person_info['age']} year old #{person_info['gender']}"
end

## 2.3
def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

## Refactor this exercise to make the result easier to predict and easier for the next programmer to maintain
## R=

## ?? there are 2 different funtions of this method, why we don't split it in two?

#my_array = []

#def add_item_string(added_item)
#  my_string ||= ''
#  my_string += added_item
#  puts "My string looks like this now: #{my_string}" 
#end

## ?? Why I need to initialize an array outside but with the hash I don't need to. is something related about the mutability of the << method? But also +- have mutability...

#def add_item_array(added_item, my_array)
#  my_array.push(added_item)
#  puts "My array looks like this now: #{my_array}"
#end

def not_so_ticky_method(add_in_string, add_in_array)
  add_in_string += 'rutabaga'
  add_in_array << 'rutabaga'

  return add_in_string, add_in_array
end

my_string = "pumpkins"
my_array = ["pumpkins"]

add_in_string, add_in_array = not_so_tricky_method(my_string, my_array)
## ?? Why not using add_in_string and add_in_array instead my_string, my_array?
puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

## 2.4
## If we use. String#split in conjunction with Array#join methods to break our string up and then put it back together again.
##Use this technique to break up the following string and put it back together with the words in reverse order:
## R=
sentence = "Humpty Dumpty sat on a wall."

words = sentence.split(/\W/)
words.reverse!
reverse_order_sentence = words.join(' ') + '.'


## 2.5
##What is the output of the following code?

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8

## R =
## answer = 42

## 2.6
##One day Spot was playing with the Munster family's home computer and he wrote a small program to mess with their demographic data:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end
##After writing this method, he typed the following...and before Grandpa could stop him, he hit the Enter key with his tail:

mess_with_demographics(munsters)
##Did the family's data get ransacked, or did the mischief only mangle a local copy of the original hash? (why?)

## R= The method will fail.. Spot didn't specify key value, will only want to add another key inside all the hash


### Pending tu understand and answer well

## 2.7 & 2.8 to short to write it.

