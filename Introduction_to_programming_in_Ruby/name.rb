puts "Hi! Please write your name"
name =  gets.chomp
puts "now pleae, your surname"
surname = gets.chomp
puts "Hoh! Nice to meet you #{name} #{surname}, how are you?"
answer = gets.chomp
puts "#{answer}? I'm sure it can be always better :)"
puts "Now before you go I don't want to forget your name so I will repeat it 10 times:"
10.times do |n|
  puts name
end 
puts "I will never forget :)"   
