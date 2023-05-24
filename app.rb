require 'json'
require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'preservedata'

class App < PreserveData
  attr_accessor :people, :books, :rentals

  def initialize
    super
    @people = []
    @books = []
    @rentals = []
    load_data
  end

  def add_book
    puts 'Enter the title of the book:'
    title = gets.chomp
    puts 'Enter the author of the book:'
    author = gets.chomp
    book = Book.new(title, author)
    books.push(book)
    puts 'Book added successfully!'
  end

  def list_books
    store = books.map { |items| "Title:#{items.title} || Author:#{items.author}" }
    puts store
  end

  def create_student
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

  def create_teacher
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

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input Number (1) or (2)]:'
    type = gets.chomp.to_i
    case type
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Invalid option'
    end
  end

  def list_people
    people.each do |person|
      if person.is_a?(Student)
        puts "[Student] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      elsif person.is_a?(Teacher)
        puts "[Teacher] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  def create_rental
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

  def list_rentals
    puts 'Enter the ID of a person:'
    id = gets.chomp.to_i

    selected_rentals = rentals.select { |rental| rental.person.id == id }

    selected_rentals.each do |rental|
      puts "Dates: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}"
    end
  end
end
