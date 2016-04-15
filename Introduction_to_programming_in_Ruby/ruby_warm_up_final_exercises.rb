require 'pry'

puts "Ex 1."
#Use the each method of Array to iterate over [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], and print out each value.
(1...10).to_a.each {|i| puts i}
puts "-----"

puts "Ex 2."
#Same as above, but only print out values greater than 5.
ary = (1...10).to_a
ary.each { |i| puts i if i > 5 }
puts "-----"

puts "Ex 3."
ary_new = ary.select {|i| i if i.odd? }
puts "-----"

puts "Ex 4."
# Append "11" to the end of the original array. Prepend "0" to the beginning.
ary.push(11)
puts ary
ary.unshift(0)
puts ary
puts "----"

puts "Ex 5."
ary.delete(11)
ary << 3
puts ary
puts "----"

puts "Ex 6."
ary = ary.uniq
#also ary.uniq!
puts ary
puts "-----"

puts "Ex 7."
puts "Array is a serie of ordered items, hash are normally unordered items with a key and a value"
puts "-----"

puts "Ex 8."
old_school_hash = {:greeting => "hi there!", "dog" => "woof!", :number => 1} 
puts old_school_hash
new_hash_sym_style =  {style:"fancy", cat:"meaow", pi:3.1416}
puts new_hash_sym_style
puts "-----"

puts "Ex 9."
#Suppose you have a hash: 
h = {a:1, b:2, c:3, d:4}

#1. Get the value of key `:b`.
puts h[:b]
#2. Add to this hash the key:value pair `{e:5}`
puts h[:e] = 5
puts h
#3. Remove all key:value pairs whose value is less than 3.5
h = h.select {|k,v| v > 3.5 }
#also h.select! ...
puts h
puts "-----"

puts "Ex 10."
puts "yes we can convert hash values into arrays,example:"
hash_2 = { one:1, two:2, three:3}
puts hash_2
array_hash_2 = hash_2.to_a
puts array_hash_2
puts "----"

puts "Ex 11."
puts "I really love Github! Shopify, Airbnb, and Soundcloud is also amazing! The old Twitter was also made it with RoR"
puts "-----"
puts "Ex 12."
# Given the following data structures. Write a program that moves the information from the array into the empty hash that applies to the correct person.
contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

contacts["Joe Smith"][:email] = contact_data.first[0]
contacts["Joe Smith"][:street] = contact_data.first[1]
contacts["Joe Smith"][:tel]= contact_data.first[2]
contacts["Sally Johnson"][:email] = contact_data.last[0]
contacts["Sally Johnson"][:street] = contact_data.last[1]
contacts["Sally Johnson"][:tel] = contact_data.last[2]

puts contacts
puts "-----"
puts "ex 13."
# Using the hash you created from the previous exercise, demonstrate how you would access Joe's email and Sally's phone number?
puts contacts["Joe Smith"][:email]
puts contacts["Sally Johnson"][:tel]
puts "-----"
puts "ex 14."
##programmatically loop or iterate over the contacts hash from exercise 12, and populate the associated data from the contact_data array

##Note that this exercise is only concerned with dealing with 1 entry in the contacts hash, like this:

#contact_data = ["joe@email.com", "123 Main st.", "555-123-4567"]
#contacts = {"Joe Smith" => {}}
contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

keys = [:email, :address, :phone]

i ||= 0
contacts.each do |name, contact_hash|
  keys.each do |key|
    contacts[name][key] = contact_data[i].first
    contact_data[i].shift
    if contact_data[i].empty?
      i += 1
    end
  end   
end
puts contacts

puts "-----"
puts "ex 15."
#Use Ruby's Array method delete_if and String method start_with? to delete all of the words that begin with an "s" in the following array.
arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
arr.delete_if { |i| i.start_with?("s") }
puts arr
puts "--"
arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
arr.delete_if {|i| i.start_with?("s", "w")}
puts arr
puts "-----"

puts "ex 16."
#Take the following array:

a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']

#and turn it into a new array that consists of strings containing one word. (ex. ["white snow", etc...] → ["white", "snow", etc...]. Look into using Array's map and flatten methods, as well as String's split method.

b = [a.map {|i| i.split(" ") }].flatten
p b
puts "-----"

puts "Ex. 17"
## What will the following program output?
hash1 = {shoes: "nike", "hat" => "adidas", :hoodie => true}
hash2 = {"hat" => "adidas", :shoes => "nike", hoodie: true}

if hash1 == hash2
  puts "These hashes are the same!"
else
  puts "These hashes are not the same!"
end
puts "Yes, are the same, just are in different order and old and new syntax"
puts "-----"
