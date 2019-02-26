def input_students
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  #get the first name
  name = gets.chomp.capitalize
  #while the name is not empty, repeat this code:
  while !name.empty? do
    #add the student hash to the array
    students << {name: name, cohort: :novemeber, country_of_birth: :England, hobbies: :coding}
    puts "Now we have #{students.count} students"
    #get another name from the user
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
  i = 0
  until i == students.length - 1 do
    puts "#{students[i][:name]} (#{students[i][:cohort]} cohort)".center(30)
    i +=1
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
