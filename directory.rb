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
  puts "Please pick one of the following options".center(100)
     puts "1. Input the students".center(100)
     puts "2. Show the students".center(100)
     puts "3. Save students to a csv file".center(100)
     puts "4. Load students from a csv file".center(100)
     puts "9. Exit the program".center(100)
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
  when "4"
    load_students
  when "9"
    exit 
  else 
    puts "I do not recognise this input, please choose again".center(100)
  end
end

# function for inputting students to array
def input_students
 @cohorts = [:January, :February, :March, :April, :May, :June, :July, :August, :September, :October, :November, :December]
 puts "please put the names of the students, their cohort, their height and country of birth, seperated by a comma and space".center(100)
 puts "To finish just hit the return twice".center(100)
 student_info = gets.chomp
 while !student_info.empty? do
     student = student_info.split(", ")
     student = cohort_assigner(student)
     @students << {name: student[0], cohort: student[1], height: student[2], birth_country: student[3]}
     student_counter
     student_info = gets.chomp
 end
  @students
end    

#cohort assignment
def cohort_assigner(student)
  if !student[1].nil? 
      if @cohorts.include? student[1].to_sym
         student[1] = student[1].to_sym
      else 
         puts "This cohort is not available, setting the cohort to November"
         student[1] = :November
      end
  else 
      puts "No cohort entered, setting cohort to November"
      student[1] = :November
  end
  return student
end

#student counter
def student_counter
 if @students.length == 1
    puts "Now we have #{@students.count} student".center(100)
 else
    puts "Now we have #{@students.count} students".center(100)
 end
end

# function for saving students to a file 
def save_students
  file = File.open("Students.csv", "w")
  @students.each do |student| 
      student_data = [student[:name], student[:cohort], student[:height], student[:birth_country]]
      csv_line = student_data.join(", ")
      file.puts csv_line
  end
  file.close
  puts "Student list saved to 'Students.csv'\n".center(100)
end

#loading student file
def load_students
  file = File.open("Students.csv", "r")
  file.readlines.each do |line|
    name, cohort, height, birth_country = line.chomp.split(', ')
    @students << {name: name, cohort: cohort.to_sym, height: height, birth_country: birth_country}
  end
  puts "Students loaded from 'Students.csv'"
  file.close
end


# function fot printing the header
def header
  puts "The students of Villians academy".center(100)
  puts '--------------------------------------------------'.center(100)
end

#function for printing student array
def print_students_list
  counter = 0
  until counter == @students.length
      puts "#{counter + 1}. #{@students[counter][:name]} (#{@students[counter][:cohort]} cohort, height: #{@students[counter][:height]}, country of birth: #{@students[counter][:birth_country]})".center(100)
      counter += 1
  end
end

# function for printing the footer
def footer
  if @students.length == 0
    puts "There are currently no students in the Villians academy\n".center(100)
  else
    puts "Overall, we have #{@students.count} great students".center(100)
    puts "--------------------------------------------------".center(100)
  end
end

# function responsible for the printing students aesthetic
def showing_students
  header
  print_students_list
  footer
end

#call methods 
interactive_menu
