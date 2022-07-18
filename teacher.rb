class Teacher < Person
  def initialize(age:, name: 'unknown', parent_permission: true)
    super(name: name, age: age, parent_permission: parent_permission)

  def can_use_services?
    true
  end
end


