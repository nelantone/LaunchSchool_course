puts "ex.1"
#How do we create an object in Ruby? Give an example of the creation of an object.
puts <<-PARAGRAPH 
In Ruby we create an objec or instance by defining a class or using an existed one instantiating it using .new method. 
Example:

class NewObject
  puts "I'm new"
end

voila = NewObject.new
PARAGRAPH
class NewObject
  puts "I'm new"
end

voila = NewObject.new
puts voila
puts "And as an unique object, have the unique ID: #{voila.object_id}"

puts "----"
puts "Ex 2."
#What is a module? What is its purpose? How do we use them with our classes? Create a module for the class you created in exercise 1 and include it properly.
puts <<-P
A module is a class with out the instantiation propiety, so then we can't create objects with a module.

His prupose is the interpolation, we do this mixing our module in different classes with "require" reserved word, then we can use the module methods inside this classes.
Example:
module NewModule
  def module_method
    puts "hi there! I'm a new method inside the module"
  end
end

then we need to add the require the module int eh class
class NewObject
  include NewModule
  ...
end
then we can use it:

voila.module_method
P
module NewModule
  def module_method
    puts "hi there! I'm a new method inside the module"
  end
end

class NewObject
  include NewModule
  puts "I'm new"
end

voila = NewObject.new

voila.module_method
puts "see the ancestors:"
puts NewObject.ancestors

puts "----"


