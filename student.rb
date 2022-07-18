class Student < Person
  def initialize(classroom)
    super('Joy', 24, false)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end

s1 = Student.new(1)
p s1.play_hooky
