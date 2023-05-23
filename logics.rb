class Logics
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

  def create_person(app)
    app.create_person
  end
end
