class Teacher < Person
  def initialize(age, specialization, name = 'unknown', parent_permission: true)
    super(name, age, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

t1 = Teacher.new('teaching')
p t1.can_use_services?
