require 'pry'

puts"Exercise 1"
#Given a hash of family members, with keys as the title and an array of names as the values, use Ruby's built-in select method to gather only immediate family members' names into a new array.

family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }
inmediate_family_hash = family.select {|k, v| k == :sisters || k == :brothers }
inmediate_family = inmediate_family_hash.values.flatten
p inmediate_family
puts "-----"
puts "Exercise 2"
#Look at Ruby's merge method. Notice that it has two versions. What is the difference between merge and merge!? Write a program that uses both and illustrate the differences.
puts "merge method will create a new hash, and merge! method will be destructive and will change the main hash, merge! modifies permanently and merge does not"
puts "-----"
puts "Exercise 3"
# Using some of Ruby's built-in Hash methods, write a program that loops through a hash and prints all of the keys. Then write a program that does the same thing except printing the values. Finally, write a program that prints both.
puts "keys"
def print_keys(hash)
  hash.select {|k,v| puts " #{k}" }
end

hash1 = { age:26, name:"Malu", height:"1.80mts"}
print_keys(hash1)
puts "values"
def print_values(hash)
  hash.select { |k,v| puts " #{v}" }
end

print_values(hash1)

puts "OR"

puts "key"
hash1.each_key {|k| puts k}
puts "value"
hash1.each_value {|v|  puts v}
puts "key and value"
hash1.each {|k,v| puts "#{k} = #{v} "}
puts "-----"
puts "Exercise 4"
#Given the following expression, how would you access the name of the person?
person = {name: 'Bob', occupation: 'web developer', hobbies: 'painting'}
puts person[:name]
puts "-----"
puts "Exercise 5"
#What method could you use to find out if a Hash contains a specific value in it? Write a program to demonstrate this use.
new_hash = { color:"green", truck:"standard", long:"30mtr" }
puts "new_hash.value?('standard')"
if new_hash.has_value?("standard")
  puts "Yes this value is inside the hash"
else
  puts "no, this value doesn't exist in the hash "
end
puts new_hash.value?("standard") #we also can use .has_value?
puts "-----"
puts "Exercise 6"
#Given the array...
words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']
# Write a program that prints out groups of words that are anagrams. Anagrams are words that have the same exact letters in them but in a different order. Your output should look something like this:
# split each of the the words letter by letter sort them letters alphabetically and put them again together.
# save the words when they are new in another place(create a hash, so then in a new key, and save the repeated ones as values)
# once we have our hash with keys and values we create iteraton to show all the groups just with the values sorted and something to let space between.

anagrams = {}
words.each do |word|
  key = word.split('').sort.join
  if anagrams.has_key?(key)
     anagrams[key].push(word)
  else
    anagrams[key] = [word]
  end
end
puts anagrams

anagrams.each do |k,v|
  puts "-----"
  puts v
end

puts "-----"
puts "Exersise 7"
#Given the following code...

x = "hi there"
my_hash = {x: "some value"}
my_hash2 = {x => "some value"}

#What's the difference between the two hashes that were created?
puts "the first hash is the nex hash syntax and the key is a symbol ':'"
puts "the second is with the old notation and as is isn't a symbol, is a string and it's an old syntax, we also use it when isn't a symbol"

puts "-----"

puts "Exercise 8"
# f you see this error, what do you suspect is the most likely problem?

#NoMethodError: undefined method `keys' for Array

puts "B. There is no method called keys for Array objects"
puts "-----"
