class Student < Person
  def initialize(age:, name: 'unknown', parent_permission: true)
    super(name: name, age: age, parent_permission: parent_permission)

  def play_hooky
    "¯\(ツ)/¯"
  end
end


