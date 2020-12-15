
students = [ 
            {name: "Dr Hannibal Lecter", cohort: :november}, 
            {name: "Darth Vader", cohort: :november}, 
            {name: "Nurse Ratchet", cohort: :november}, 
            {name: "Michael Corleone", cohort: :november}, 
            {name: "Alex DeLarge", cohort: :november}, 
            {name: "The Wicked Witch of the West", cohort: :november}, 
            {name: "Terminator", cohort: :november}, 
            {name: "Freddy Krueger", cohort: :november}, 
            {name: "The Joker", cohort: :november}, 
            {name: "Joffrey Baratheon", cohort: :november}, 
            {name: "Norman Bates", cohort: :november}
            ]
            
def header
    puts "The students of Villians academy"
    puts '--------------------------------'
end

def print(students)
    students.each do |student|
        puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
end

def footer(students)
    puts "Overall, we have #{students.count} great students"
end

header
print(students)
footer(students)

