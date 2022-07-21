require_relative 'classroom'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
@class_room_1 = Classroom.new('microverse_one')
@persons = []
@books=[]
@rentals=[]
def list_all_books
  @books.each {|book| puts "Title: \"#{book.title}\", Author: \"#{book.author}\""}
end

def list_all_people
  @persons.each {|person| puts "[#{person.class}] Name: #{person.name}, Id: #{person.id}, age: #{person.age},"}
end

def create_person
  print 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
  input = gets.chop.to_i
  if [1, 2].include?(input)
    print 'age:'
    age = gets.chomp.to_i
    print 'Name:'
    name = gets.chomp
    case input
    when 1
      print 'Hase parent permission [Y/N]:'
      permission = gets.chomp
      permission = permission.upcase == 'Y'
      student = Student.new(age, @class_room_1, name, permission)
      @persons.push(student)
      puts "persons #{@persons.length}"
    when 2
      print 'Specialization'
      specialization = gets.chomp
      teacher = Teacher.new(age, specialization, name)
      @persons.push(teacher)
      puts 'Person created  successfully'
    end
  else
    puts 'Invalid input'
  end
end

def create_book
    print "Title: "
    title=gets.chomp
    print "Author: "
    author=gets.chomp
    @books.push(Book.new(title,author))
    puts "Book created successfuly"
end

def create_rental
  puts "Select a book from the following list by number"
  list_all_books
  book_id=gets.chomp
  book=nil
  if(book_id.to_i.to_s==book_id&&book_id.to_i<@books.length)
    book=@books[book_id.to_i]
  end
  puts "Select a person from the following list by number (not id)"
  list_all_people
  person=nil
  person_id=gets.chomp
    if(person_id.to_i.to_s==person_id&&person_id.to_i<@persons.length)
    person=@persons[person_id.to_i]
  end
  if book&&person
    print "Date: "
    date=gets.chomp
    @rentals.push(Rental.new(date, book, person))
    puts 'Rental created successfuly'
  else
    puts "invalid person or book ID"
  end
end

def list_all_rentals
  puts 'list all rents'
end
