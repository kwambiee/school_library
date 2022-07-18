class Teacher < Person
  def initialize(specialization)
    super()
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

t1 = Teacher.new('teaching')
p t1.can_use_services?
