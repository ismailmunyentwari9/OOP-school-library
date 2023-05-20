require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'

class App
  def add_book(books)
    puts 'Enter the title of the book:'
    title = gets.chomp
    puts 'Enter the author of the book:'
    author = gets.chomp
    book = Book.new(title, author)
    books.push(book)
    puts 'Book added successfully!'
  end

  def list_books(books)
    store = books.map { |items| "Title:#{items.title} || Author:#{items.author}" }
    puts store
  end

  def create_student(people)
    puts 'Age:'
    age = gets.chomp.to_i
    puts 'Name:'
    name = gets.chomp
    puts "Parent's permission [Y/N]:"
    permission = gets.chomp.upcase
    parent_permissions = permission == 'Y'
    names = name
    student = Student.new(age, name: names, parent_permission: parent_permissions)
    people.push(student)
    puts 'People added successfully!'
  end

  def create_teacher(people)
    puts 'Age:'
    age = gets.chomp.to_i
    puts 'Name:'
    name = gets.chomp
    puts 'Specialization:'
    specialization = gets.chomp
    teacher = Teacher.new(specialization, age, name: name)
    people.push(teacher)
    puts 'People added successfully!'
  end

  def list_people(people)
    people.each do |person|
      if person.is_a?(Student)
        puts "[Student] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      elsif person.is_a?(Teacher)
        puts "[Teacher] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  def create_rental(books, people, rentals)
    puts 'Select a book from the following list by number:'
    books_with_indexes = books.map.with_index do |items, index|
      "#{index}) Title: #{items.title} || Author: #{items.author}"
    end
    puts books_with_indexes

    book_option = gets.chomp.to_i
    selected_book = books[book_option]

    puts 'Select a person from the following list by number (NB: Not ID):'
    people.each.with_index do |person, index|
      if person.is_a?(Student)
        puts "#{index}) [Student] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      elsif person.is_a?(Teacher)
        puts "#{index}) [Teacher] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
    person_option = gets.chomp.to_i
    selected_person = people[person_option]

    puts 'Enter rental dates:'
    dates = gets.chomp

    rental = Rental.new(dates, selected_book, selected_person)
    rentals.push(rental)
    puts 'Rental created successfully!'
  end

  def list_rentals(rentals)
    puts 'Enter the ID of a person:'
    id = gets.chomp.to_i

    selected_rentals = rentals.select { |rental| rental.person.id == id }

    selected_rentals.each do |rental|
      puts "Dates: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}"
    end
  end
end
