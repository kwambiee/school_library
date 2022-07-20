class Classroom
    attr_accessor :label
    def initialize(label)
        @label=label
        @students=[]
    end
    def add_students(student)
        @students.push(student)
        student.label=self
    end
end