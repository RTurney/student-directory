
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
            
def header
    puts "The students of Villians academy"
    puts '--------------------------------'
end

def print(name_array)
    name_array.each do |student|
        puts student
    end
end

def footer(names)
    puts "Overall, we have #{names.count} great students"
end

header
print(students)
footer(students)

