
students = [ 
            "Dr Hannibal Lecter", 
            "Darth Vader", 
            "Nurse Ratchet", 
            "Michael Corleone", 
            "Alex DeLarge", 
            "The Wicked Witch of the West", 
            "Terminator", 
            "Freddy Krueger", 
            "The Joker", 
            "Joffrey Baratheon", 
            "Norman Bates"
            ]

puts "The students of Villians academy"
puts '--------------------------------'
students.each do |student|
    puts student
end

puts "overall we have #{students.count} great students"