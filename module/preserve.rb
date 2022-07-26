module PreserveData


def write_json
    File.open('books.json', 'w') do |file|
      file.write(@books.to_json, mode: 'a')
    end
    File.open('people.json', 'w') do |file|
      file.write(@people.to_json, mode: 'a')
    end
    File.open('rentals.json', 'w') do |file|
      file.write(@rentals.to_json, mode: 'a')
    end
  end

  def read_json
    @books = JSON.parse(File.read('books.json'))
    @people = JSON.parse(File.read('people.json'))
    @rentals = JSON.parse(File.read('rentals.json'))
  end
end