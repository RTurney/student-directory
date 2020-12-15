def input_students
   students = []
   puts "please put the names of the students"
   puts "To finish just hit the return twice"
   name = gets.chomp
   while !name.empty? do
       students << {name: name, cohort: :november}
       puts "Now we have #{students.count} students"
       name = gets.chomp
    end
    students
end    

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

students = input_students
header
print(students)
footer(students)

