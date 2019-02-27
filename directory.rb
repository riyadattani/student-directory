def input_students
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"
  students = []
  #get the first name
  name = gets.chomp.capitalize
  #while the name is not empty, repeat this code:
  while !name.empty? do
    puts "Which cohort are they in?"
    month = gets.chomp.capitalize.to_sym
    if month.empty?
      month = "TBC".to_sym
    end
    #add the student hash to the array
    students << {name: name, cohort: month}
    if students.count == 1
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end
    #get another name from the user
    puts "Enter the name of the student"
    name = gets.chomp.capitalize
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy".center(30)
  puts "-------------".center(30)
end

def print(students)
  students.each_with_index do |student, index|
    puts "#{index +1}. #{student[:name]} (#{student[:cohort]} cohort)".center(30)
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(30)
end

students = input_students
#nothing happens until we call the methods
print_header
print(students)
print_footer(students)
