puts "Ex 1."
#COMMENT Create a class called MyCar. When you initialize a new instance or object of the class, allow the user to define some instance variables that tell us the year, color, and model of the car. Create an instance variable that is set to 0 during instantiation of the object to track the current speed of the car as well. Create instance methods that allow the car to speed up, brake, and shut the car off.

puts "Ex 2."
#Add an accessor method to your MyCar class to change and view the color of your car. Then add an accessor method that allows you to view, but not modify, the year of your car.

puts "Ex 3."
# You want to create a nice interface that allows you to accurately describe the action you want your program to perform. Create a method called spray_paint that can be called on an object and will modify the color of the car.
puts "---"
puts "Ex. II"
puts "Ex.1"
# Add a class method to your MyCar class that calculates the gas mileage of any car.
puts "Ex.2"
# Override the to_s method to create a user friendly print out of your object.
puts "Ex. 3"
## When running the following code...
puts <<-PHAR
class Person
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"

We get the following error...

test.rb:9:in `<main>': undefined method `name=' for
  #<Person:0x007fef41838a28 @name="Steve"> (NoMethodError)

R= because we just add a getter method but we want to set the match/value to a new variable, we need to add a setter method. The shortest way it is:
attr_accessor :name
instead attr_reader
if we only want to change the value and not use the getter funtionality/method
PHAR

class MyCar

  attr_reader :year, :model
  attr_accessor :color

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
  end
  
  def speed_up(num)
    "The car  #{model} from #{year} is speeing up in #{@current_speed = num + @current_speed}" 
    @total_milestones = num
  end
  
  def brake(num)
    "The car #{model} from #{year}, is breaking from #{@current_speed} to #{@current_speed = @current_speed - num}."
  end
  
  def shut_off
      puts "we are now running at #{@current_speed} km/hr but we will stop..."
      @current_speed = 0
     "The car #{model} from #{year} is off. now needs to be in #{@current_speed} km/h as it stops"
  end
  
  def info
    "Hy there! My car is a #{model} from #{year} and nowadays is #{color}, I thinking to paint my car soon again."
  end  

  def spray_paint(color)
     puts "I'm painting  my #{@color} car to #{color}, yay!"
     puts "now is #{@color = color}... Not so happy with this color...Anyway"
  end  

  def total_milestones(liters, km)
    "you consumed: #{km/liters} km per liter of gas"
  end

  def to_s
    "the info about this car... model:  #{model}, color: #{color}, year: #{year}"
  end
end

my_car= MyCar.new(2009, "blue","Peugeot 406")
puts my_car
puts my_car.speed_up(200)
puts my_car.total_milestones(200,1.2)
puts "--"
puts my_car.brake(100)
puts "--"
puts my_car.brake(100)
puts "--"
puts my_car.shut_off
puts "--"
puts my_car.info
my_car.color = "red"
puts "--"
puts my_car.info
puts "--"
puts my_car.spray_paint("green")
puts "--"
puts my_car.info
