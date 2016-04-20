require 'pry'

puts "Ex 1"
=begin
Create a superclass called Vehicle for your MyCar class to inherit from and move the behavior that isn't specific to the MyCar class to the superclass. Create a constant in your MyCar class that stores information about the vehicle that makes it different from other types of Vehicles.

Then create a new class called MyTruck that inherits from your superclass that also has a constant defined that separates it from the MyCar class in some way.
=end

puts "ex 2."
=begin
Add a class variable to your superclass that can keep track of the number of objects created that inherit from the superclass. Create a method to print out the value of this class variable as well.
=end

puts "ex 3."
#Create a module that you can mix in to ONE of your subclasses that describes a behavior unique to that subclass.
puts "ex 4."
#Print to the screen your method lookup for the classes that you have created.
puts "ex 5."
#Move all of the methods from the MyCar class that also pertain to the MyTruck class into the Vehicle class.
#Make sure that all of your previous method calls are working when you are finished.
puts "ex 6."
#Write a method called age that calls a private method to calculate the age of the vehicle.
#Make sure the private method is not available from outside of the class. You'll need to use Ruby's built-in Time class to help.

module CarInfo
  def info
    puts  "Hy there! My car is a #{model} from #{year} and nowadays is #{color}, I thinking to paint my car soon again."
  end
end

class Vehicle
  @@number_of_vehicles = 0

  attr_reader :year, :model
  attr_accessor :color

  def initialize(year, color, model)
    @@number_of_vehicles += 1
    @year = year
    @color = color
    @model = model
    @current_speed = 0
  end

  def self.number_of_vehicles
    puts "this programm as created #{@@number_of_vehicles} vehicles"
  end

  def self.total_milestones(liters, km)
    "you consumed: #{km/liters} km per liter of gas"
  end

  def speed_up(num)
    puts "The vehicle  #{model} from #{year} is speeing up in #{@current_speed = num + @current_speed}"
  end

  def brake(num)
    "The vehicle #{model} from #{year}, is breaking from #{@current_speed} to #{@current_speed = @current_speed - num}."
  end

  def shut_off
      puts "we are now running at #{@current_speed} km/hr but we will stop..."
      @current_speed = 0
     "The car #{model} from #{year} is off. now needs to be in #{@current_speed} km/h as it stops"
  end

  def to_s
    "the info about this vehicle.. model:  #{model}, color: #{color}, year: #{year}. This vehicle is #{age_of_vehicle}"
  end

  private
  def age_of_vehicle
     years_vehicle = Time.now.year - year
     "#{years_vehicle} years old"
  end
end

class MyTruck < Vehicle
  NUM_OF_DOORS = 2
end

class MyCar < Vehicle
  include CarInfo

  NUM_OF_DOORS = 4

  def spray_paint(color)
     puts "I'm painting  my #{@color} car to #{color}, yay!"
     puts "now is #{@color = color}... Not so happy with this color...Anyway"
  end
end

puts seat = MyCar.new(2015,'blue','Seat')
puts MyCar.new(2001, 'red','BMW')
puts Vehicle.number_of_vehicles
puts pegaso = MyTruck.new(2015,'blue','Pegasus')
puts pegaso.speed_up(50)
puts Vehicle.number_of_vehicles
puts "--"
puts seat.info
puts "R: ex4 "
p Vehicle.ancestors
p MyCar.ancestors
p MyTruck.ancestors
puts "bonus, in module"
p CarInfo.ancestors
puts "---"
puts pegaso

puts "ex 7."
#Create a class 'Student' with attributes name and grade. Do NOT make the grade getter public, so joe.grade will raise an error.
#Create a better_grade_than? method, that you can call like so...

class Student
  attr_reader :name
  attr_writer :grade

  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(other_student)
    @grade > other_student.grade
  end

  protected

  def grade
    @grade
  end
end

p joe = Student.new("joe", 10)
bob = Student.new("bob", 8)

puts "Well done!" if joe.better_grade_than?(bob)
puts joe.grade

puts "ex 8."
## Given the following code...

# bob = Person.new
# bob.hi

## And the corresponding error message...

# NoMethodError: private method `hi' called for #<Person:0x007ff61dbb79f0>
# from (irb):8
# from /usr/local/rvm/rubies/ruby-2.0.0-rc2/bin/irb:16:in `<main>'

## What is the problem and how would you go about fixing it?

puts "hi is a private method, to acces we need to make it public (moving avobe the private method)"
