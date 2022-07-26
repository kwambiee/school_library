require 'json'

module PreserveData

  def load_persons
    if File.exist?('./data/people.json')
      JSON.parse.(File.read('./data/people.json')).each do |person|
        if person['class'] == 'Student'
          @people.push(Student.new(person['age'], person['name'], parent_permission: person['parent_permission']))
        else
          @people.push(Teacher.new(person['age'], person['name']))
        end
      end
    else
      puts 'No data found!'
    end
  end
end