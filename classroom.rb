class Classroom
  attr_accessor :label, :students

  def initialize(label)
    super()
    @label = label
    @students = []
  end

  def add_students(student)
    @students.push(student)
    student.classroom = self
  end
end
