@students = [] #empty array accessible to all methods

def input_students
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp.capitalize
  #while the name is not empty, repeat this code:
  while !name.empty? do
    puts "Which cohort are they in?"
    month = STDIN.gets.chomp.capitalize.to_sym
    if month.empty?
      month = "TBC".to_sym
    end
    #add the student hash to the array
    @students << {name: name, cohort: month}
    if @students.count == 1
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
    #get another name from the user
    puts "Enter the name of the student"
    name = STDIN.gets.chomp.capitalize
  end
end

#----------Interactive Menu----------
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.cvs"
  puts "4. Load the list from students.cvs"
  puts "9. Exit"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else
    puts "I dont know what you meant, try again"
  end
end

#----------Methods---------

def print_header
  puts "The students of Villains Academy".center(30)
  puts "-------------".center(30)
end

def print_students_list
  if @students.count >= 1
    @students.each_with_index do |student, index|
      puts "#{index +1}. #{student[:name]} (#{student[:cohort]} cohort)".center(30)
    end
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students".center(30)
end

#----------Saving and loading the file ---------

def save_students
  file = File.open("students.cvs", "w")
  @students. each do |student|
    student_data = [student[:name], student[:cohort]]
    cvs_line = student_data.join(", ")
    file.puts cvs_line
  end
  file.close
end

def load_students(filename = "students.cvs") # will load from students.csv by default
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, month = line.chomp.split(", ")
    @students << {name: name, cohort: month}
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

try_load_students
interactive_menu
