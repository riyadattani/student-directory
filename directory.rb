@students = [] #empty array accessible to all methods

def input_students
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"
  name = gets.chomp.capitalize
  #while the name is not empty, repeat this code:
  while !name.empty? do
    puts "Which cohort are they in?"
    month = gets.chomp.capitalize.to_sym
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
    name = gets.chomp.capitalize
  end
end

#----------Interactive Menu----------

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.cvs"
  puts "9. Exit"
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
  if @students.count > 1
    @students.each_with_index do |student, index|
      puts "#{index +1}. #{student[:name]} (#{student[:cohort]} cohort)".center(30)
    end
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students".center(30)
end

#----------Saving the file ---------

def save_students
  #open the file for writing
  flie = File.open("students.cvs", "w")
  # iterate over the array of students
  @students. each do |student|
    student_data = [student[:name], student[:cohort.capitalize]]
    cvs_line = student_data.join(", ")
    file.puts cvs_line
  end
  flie.close
end

interactive_menu
