require './person'

class Student < Person
  attr_reader :label

  def initialize(age, classroom, name = 'unknown', parent_permission: true)
    super(age: age, name: name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def label=(label)
    @label = label
    label.students.push(self) unless label.students.push.include?(self)
  end
end
