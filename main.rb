require_relative 'person'
require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'app'
require_relative 'logics'

class Main < Logics
  def process_list_books(app, books)
    app.list_books(books)
  end

  def process_list_people(app, people)
    app.list_people(people)
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
end
main_entry = Main.new
main_entry.main
