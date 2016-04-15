puts "Exercise 1"
#Write a program that checks if the sequence of characters "lab" exists in the following strings. If it does exist, print out the word. - "laboratory" - "experiment" - "Pans Labyrinth" - "elaborate" - "polar bear"

def lab_in(string)
  if string =~ /lab/
    puts "laboratory"
  else
    puts "try different string"
  end
end
lab_in("laboratory")
lab_in("experiment")
lab_in("Pans Labyrinth")
lab_in("elaborate")
lab_in("polar bear")
puts "----"

"Exercise 2"
##What will the following program print to the screen? What will it return?
def execute(&block)
  block
end


execute { puts "Hello from inside the execute method!" }

puts "as we didn't invoke block.call inside the execute method, the block will not be executed"
puts "The method returns a Proc object??"
puts "-----"
puts "Exercise 3"
#What is exception handling and what problem does it solve?
puts "exception handling is when we use begin and rescue as conditionals, we will solve the raising exceptions(errors), giving a message when we reach an error and continue, instead stoping the chain"
puts "-----"

puts "Exercise 4"
#Modify the code in exercise 2 to make the block execute properly.
def execute(&block)
  block.call
end

execute {puts "Hey there! I'm a called block inside a method"}
puts "-----"

puts "Exercise 5"
##Why does the following code...

#def execute(block)
#  block.call
#end

#execute { puts "Hello from inside the execute method!" }

##Give us the following error when we run it?

#block.rb1:in `execute': wrong number of arguments (0 for 1) (ArgumentError)
#from test.rb:5:in `<main>'

puts "It seems that we want to pass a block inside the method but we forgot the ampelsand(&), the ampelsand allows a block to be passed as parameter"
puts "-----"

