require_relative 'person'
require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'app'
require_relative 'logics'

class Main < Logics
  def main
    app = App.new

    loop do
      print_menu
      option = gets.chomp.to_i

      process(option, app)
    end
  end

  def process(option, app)
    case option
    when 1
      app.list_books
    when 2
      app.list_people
    when 3
      app.create_person
    when 4
      app.add_book
    when 5
      app.create_rental
    when 6
      app.list_rentals
    when 7
      exit
    else
      puts 'Invalid option'
    end
  end
end

main_entry = Main.new
main_entry.main
