def interactive_menu
   students = [] 
   loop do 
       puts "Please pick one of the following options"
       puts "1. Input the students"
       puts "2. Show the students"
       puts "9. Exit the program"
       user_selection = gets.chomp
       
       case user_selection
        when "1"
           students = input_students(students)
        when "2"
            header
            print(students)
            footer(students)
        when "9"
            exit 
        else 
            puts "I do not recognise this input, please choose again"
       end
    end
end


def input_students(students)
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
    students.each.with_index do |student, index|
        puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
end

def footer(students)
    puts "Overall, we have #{students.count} great students"
    puts "--------------------------------------------------"
end

interactive_menu
