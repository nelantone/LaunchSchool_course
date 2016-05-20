### Medium 3 ###
## 3.1
##Predict how the values and object ids will change throughout the flow of the code below:

def fun_with_ids
  a_outer = 42
  b_outer = "forty two"
  c_outer = [42]
  d_outer = c_outer[0]

  a_outer_id = a_outer.object_id
  b_outer_id = b_outer.object_id
  c_outer_id = c_outer.object_id
  d_outer_id = d_outer.object_id

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} before the block."
  puts 'R= 42 a_outer_id=44(example)'
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} before the block."
  puts 'R= \'forty two\' id=1234(example)'
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} before the block."
  puts 'R= [42] id=12345(ex)'
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} before the block."
  puts "R= 42 id=44 (same as a_outer,same num)\n\n"

  1.times do
    a_outer_inner_id = a_outer.object_id
    b_outer_inner_id = b_outer.object_id
    c_outer_inner_id = c_outer.object_id
    d_outer_inner_id = d_outer.object_id

    puts "a_outer id was #{a_outer_id} before the block and is: #{a_outer_inner_id} inside the block."
    puts "b_outer id was #{b_outer_id} before the block and is: #{b_outer_inner_id} inside the block."
    puts "c_outer id was #{c_outer_id} before the block and is: #{c_outer_inner_id} inside the block."
    puts "d_outer id was #{d_outer_id} before the block and is: #{d_outer_inner_id} inside the block."
    puts "R= all the same ids.\n\n"

    a_outer = 22
    b_outer = "thirty three"
    c_outer = [44]
    d_outer = c_outer[0]

    puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after."
    puts 'R= number has changed id has changed'
    puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after."
    puts 'R=content in string has changed number has changed'
    puts "c_outer inside after reassignment is #{c_outer} with an id of: #{c_outer_id} before and: #{c_outer.object_id} after."
    puts 'R= content inside array has changed id changed'
    puts "d_outer inside after reassignment is #{d_outer} with an id of: #{d_outer_id} before and: #{d_outer.object_id} after."
    puts "R= content in a_outer has changed as is not the same Float will have different id as the new a_outer id. \n\n"

    a_inner = a_outer
    b_inner = b_outer
    c_inner = c_outer
    d_inner = c_inner[0]

    a_inner_id = a_inner.object_id
    b_inner_id = b_inner.object_id
    c_inner_id = c_inner.object_id
    d_inner_id = d_inner.object_id

    puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the block (compared to #{a_outer.object_id} for outer)."
    puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the block (compared to #{b_outer.object_id} for outer)."
    puts "c_inner is #{c_inner} with an id of: #{c_inner_id} inside the block (compared to #{c_outer.object_id} for outer)." 
    puts 'R= same id'
    puts "d_inner is #{d_inner} with an id of: #{d_inner_id} inside the block (compared to #{d_outer.object_id} for outer)."
    puts "R= again the id will be the same as a_inner id, inside the block as d_outer= 44 and  a_outer=44 id will be the same.\n\n"
  end
  
  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the block."
  puts 'R= Float value changed id changed'
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the block."
  puts 'R= Different string, changed id'
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the block."
  puts 'R= Different Array content,different id'
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} BEFORE and: #{d_outer.object_id} AFTER the block."
  puts "R= Different number different id .\n\n"

  ###PENDING
  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts 'R= a_inner is initialized inside the block,this is why a_inner it\'s undefined.'
  puts 'Error: undefined local variable or method `a_inner\' for main:Object (NameError)'
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the block.\n\n" rescue puts "ugh ohhhhh"
end
fun_with_ids

## 3.2  
## Here we haven't changed ANY of the code outside of inside of the block/method. We simply took the contents of the block from the previous exercise and moved it to a method, to which we are passing all of our outer variables.

##Predict how the values and object ids will change throughout the flow of the code below:
## R= nothing has changed, we have the same results as avobe.

## 3.3
## Study the following code and state what will be displayed...and why:

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

## R= The difference is that my_string will only show 'pumpkins' and not 'rutabaga' += it
## overwrites the string inside the method. Instead << pass both strings inside the array.
## c += a is equivalent to c = c + a, in this case a_string_param = astring_param + 'rutabaga'
## but when there is the new object outise the method it forgets the object inside. In this case we make my_string = 'pumpkins' so woll just give me 'my_string' a_string_param doesn't exist outside the method.

## 3.4
## To drive that last one home...let's turn the tables and have the string show a modified output, while the array thwarts the method's efforts to modify the caller's version of it.

def tricky_method_two(a_string_param, an_array_param)
  a_string_param.gsub!('pumpkins', 'rutabaga')
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

## R= It will be my_string = rubataga, my_array = ['pumpkins']
## Is the opposite as before we overwrite the array method in ths case, but also we made a substitution with the value.

## 3.5
##How could the unnecessary duplication in this method be removed?

#def color_valid(color)
#  if color == "blue" || color == "green"
#    true
#  else
#    false
#  end
#end

## R= ruby automaticaly will check statemens with ||
def color_valid(color)
  color == 'blue' || color == 'geen'
end

