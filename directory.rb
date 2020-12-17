# form empty array for students
@students = [] 
@cohorts = [:January, :February, :March, :April, :May, :June, :July, :August, :September, :October, :November, :December]

# function for interactive menu
def interactive_menu
 loop do 
     print_menu
     user_selection(STDIN.gets.chomp)
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
def user_selection(selection)
  case selection
   when "1"
    puts "You have chosen to add more students\n".center(100)
    @students = input_students
  when "2"
    puts "You have chosen to see our current student list\n".center(100)
    student_displayer
  when "3"
    "You have save our current student list to a csv file\n".center(100)
    save_students
  when "4"
    "You have chosen to load students from a csv file\n".center(100)
    load_students
  when "9"
    puts "Okay bye".center(100)
    exit 
  else 
    puts "I do not recognise this input, please choose again".center(100)
  end
end

# function for pushing individual students into the students array
def student_array_adder(name, cohort, hobby, birth_country)
  @students << {name: name, cohort: cohort, hobby: hobby, birth_country: birth_country}
  return @students
end

# function for checking and inputting students from user input
def input_students
 puts "please put the names of the students, their cohort, their hobby and country of birth, seperated by a comma and space".center(100)
 puts "To finish just hit the return twice".center(100)
 student_info = STDIN.gets.chomp
 # push student info into student adding loop
 student_loop(student_info)
  @students
end

# function for student adding while loop
def student_loop(student_info)
  while !student_info.empty? do
   #split student info into variables
   name, cohort, hobby, birth_country = student_info.split(", ")
   #check cohort
   cohort = cohort_assigner(cohort)
   #add student to student array
   student_array_adder(name, cohort, hobby, birth_country)
   #count students now
   student_counter
   #reset student_info to empty
   student_info = STDIN.gets.chomp
  end
end  

#cohort assignment
def cohort_assigner(cohort)
  if !cohort.nil? 
      if @cohorts.include? cohort.to_sym
         cohort = cohort.to_sym
      else 
         puts "This cohort is not available, setting the cohort to November"
         cohort = :November
      end
  else 
      puts "No cohort entered, setting cohort to November"
      cohort = :November
  end
  return cohort
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
      student_data = [student[:name], student[:cohort], student[:hobby], student[:birth_country]]
      csv_line = student_data.join(", ")
      file.puts csv_line
  end
  file.close
  puts "Student list saved to 'Students.csv'\n".center(100)
end

#loading student file
def load_students(filename = "Students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort, hobby, birth_country = line.chomp.split(', ')
    student_array_adder(name, cohort, hobby, birth_country)
  end
  puts "Students loaded from #{filename}"
  file.close
end

#try loading files
def try_load_file
  !ARGV.empty? ? (filename = ARGV.first) :  (filename = 'Students.csv')
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else 
    puts "#{filename} doesn't exist"
    exit
  end
end

# function fot printing the header
def print_header
  puts "The students of Villians academy".center(100)
  puts '--------------------------------------------------'.center(100)
end

#function for printing student array
def print_students_list
  counter = 0
  until counter == @students.length
      puts "#{counter + 1}. #{@students[counter][:name]} (#{@students[counter][:cohort]} cohort, hobby: #{@students[counter][:hobby]}, country of birth: #{@students[counter][:birth_country]})".center(100)
      counter += 1
  end
end

# function for printing the footer
def print_footer
  if @students.length == 0
    puts "There are currently no students in the Villians academy\n".center(100)
  else
    puts "Overall, we have #{@students.count} great students".center(100)
    puts "--------------------------------------------------".center(100)
  end
end

# function responsible for the printing students aesthetic
def student_displayer
  print_header
  print_students_list
  print_footer
end

#call methods 
try_load_file
interactive_menu
