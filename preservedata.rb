class PreserveData
  # preserving the data...
  def save_data
    save_books
    save_people
    save_rentals
    puts 'Data saved successfully!'
  end

  def load_data
    load_books
    load_people
    load_rentals
    puts 'Data loaded successfully!'
  end

  private

  def save_books
    book_data = books.map { |book| { 'title' => book.title, 'author' => book.author } }
    File.write('books.json', JSON.generate(book_data))
  end

  def save_people
    people_data = people.map do |person|
      if person.is_a?(Student)
        {
          'id' => person.id,
          'type' => 'student',
          'name' => person.name,
          'age' => person.age,
          'parent_permission' => person.parent_permission
        }
      elsif person.is_a?(Teacher)
        {
          'id' => person.id,
          'type' => 'teacher',
          'name' => person.name,
          'age' => person.age,
          'specialization' => person.specialization
        }
      end
    end

    File.write('people.json', JSON.generate(people_data))
  end

  def save_rentals
    File.write('rentals.json', JSON.generate(rentals))
  end

  def load_books
    if File.exist?('books.json')
      if File.empty?('books.json')
        puts 'Books data file is empty.'
        @books = []
      else
        begin
          books_data = JSON.parse(File.read('books.json'))
          @books = books_data.map { |data| Book.new(data['title'], data['author']) }
        rescue JSON::ParserError => e
          puts "Error parsing 'books.json' file: #{e.message}"
          @books = []
        end
      end
    else
      puts 'Books data file not found.'
      @books = []
    end
  end

  def load_people
    if File.exist?('people.json')
      if File.empty?('people.json')
        puts 'People data file is empty.'
        @people = []
      else
        begin
          people_data = JSON.parse(File.read('people.json'))
          @people = people_data.map do |data|
            if data['type'] == 'student'
              Student.new(data['age'], name: data['name'], parent_permission: data['parent_permission'])
            elsif data['type'] == 'teacher'
              Teacher.new(data['specialization'], data['age'], name: data['name'])
            end
          end
        rescue JSON::ParserError => e
          puts "Error parsing 'people.json' file: #{e.message}"
          @people = []
        end
      end
    else
      puts 'People data file not found.'
      @people = []
    end
  end

  def load_rentals
    if File.exist?('rentals.json')
      if File.empty?('rentals.json')
        puts 'Rental data file is empty.'
        @rentals = []
      else
        begin
          rentals_data = JSON.parse(File.read('rentals.json'))
          @rentals = rentals_data.map do |data|
            book = @books.find { |book_items| book_items.title == data['title'] }
            date = data['date']
            Rental.new(date, book, person)
          end
        rescue JSON::ParserError => e
          puts "Error parsing 'rentals.json' file: #{e.message}"
          @rentals = []
        end
      end
    else
      puts 'Rental data file not found.'
      @rentals = []
    end
  end
end
