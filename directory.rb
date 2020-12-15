# function for interactive menu
def interactive_menu
   @students = [] 
   loop do 
       print_menu
       process(gets.chomp)
    end
end

# print menu function
def print_menu
    puts "Please pick one of the following options"
       puts "1. Input the students"
       puts "2. Show the students"
       puts "3. Save students to a csv file"
       puts "9. Exit the program" 
end

#function for defining each selection in the menu
def process(selection)
    case selection
     when "1"
       @students = input_students
    when "2"
        showing_students
    when "3"
        save_students
    when "9"
        exit 
    else 
        puts "I do not recognise this input, please choose again"
    end
end

# function for inputting students to array
def input_students
   puts "please put the names of the students"
   puts "To finish just hit the return twice"
   name = gets.chomp
   while !name.empty? do
       @students << {name: name, cohort: :november}
       puts "Now we have #{@students.count} students"
       name = gets.chomp
   end
    @students
end    

# function for saving students to a file 
def save_students
    file = File.open("Students.csv", "w")
    @students.each do |student| 
        student_data = [student[:name], student[:cohort]]
        csv_line = student_data.join(", ")
        file.puts csv_line
    end
    file.close
    puts "Student list saved to 'Students.csv'"
    puts ""
end

# function fot printing the header
def header
    puts "The students of Villians academy"
    puts '--------------------------------'
end

#function for printing student array
def print_students_list
    @students.each.with_index do |student, index|
        puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
end

# function for printing the footer
def footer
    puts "Overall, we have #{@students.count} great students"
    puts "--------------------------------------------------"
end

# function responsible for the printing students aesthetic
def showing_students
    header
    print_students_list
    footer
end

#call methods 
interactive_menu
