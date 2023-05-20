#!/usr/bin/env ruby
require_relative 'person'
require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'app'

def print_menu
  puts ''
  puts 'Welcome To School Library App 🤩'
  puts '*************************'
  puts ''
  puts 'Please Enter An Option by Entering a number'
  puts '1 - List all books.'
  puts '2 - List all people.'
  puts '3 - Create a person (teacher or student, not a plain Person).'
  puts '4 - Create a book.'
  puts '5 - Create a rental.'
  puts '6 - List all rentals for a given person id.'
  puts '7 - Exit ❌'
  puts ''
end

def process_list_books(app, books)
  app.list_books(books)
end

def process_list_people(app, people)
  app.list_people(people)
end

def create_person(app, people)
  puts 'Do you want to create a student (1) or a teacher (2)? [Input Number (1) or (2)]:'
  type = gets.chomp.to_i
  case type
  when 1
    app.create_student(people)
  when 2
    app.create_teacher(people)
  else
    puts 'Invalid option'
  end
end

def process_add_book(app, books)
  app.add_book(books)
end

def process_create_rental(app, books, people, rentals)
  app.create_rental(books, people, rentals)
end

def process_list_rentals(app, rentals)
  app.list_rentals(rentals)
end

def main
  people = []
  books = []
  rentals = []
  app = App.new

  loop do
    print_menu
    option = gets.chomp.to_i

    process(option, app, books, people, rentals)
  end
end

def process(option,
            app, books, people, rentals)
  case option
  when 1
    process_list_books(app, books)
  when 2
    process_list_people(app, people)
  when 3
    create_person(app, people)
  when 4
    process_add_book(app, books)
  when 5
    process_create_rental(app, books, people, rentals)
  when 6
    process_list_rentals(app, rentals)
  when 7
    exit
  else
    puts 'Invalid option'
  end
end
main
