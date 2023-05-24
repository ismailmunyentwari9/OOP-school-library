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
    File.open('books.json', 'w') do |file|
      file.write(JSON.generate(books))
    end
  end

  def save_people
    File.open('people.json', 'w') do |file|
      file.write(JSON.generate(people))
    end
  end

  def save_rentals
    File.open('rentals.json', 'w') do |file|
      file.write(JSON.generate(rentals))
    end
  end

  def load_books
    if File.exist?('books.json')
      if File.zero?('books.json')
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
      if File.zero?('people.json')
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
      if File.zero?('rentals.json')
        puts 'Rental data file is empty.'
        @rentals = []
      else
        begin
          rentals_data = JSON.parse(File.read('rentals.json'))
          @rentals = rentals_data.map do |data|
            book = @books.find { |book| book.title == data['title'] }
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
